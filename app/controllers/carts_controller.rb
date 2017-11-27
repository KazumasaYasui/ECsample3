class CartsController < ApplicationController
  before_action :authenticate_user!,
                except: [:add_to_cart, :view_order,
                        :update_cart, :delete_cart]

  def add_to_cart
    @product = Product.find(params[:product_id])
    if @product.quantity >= params[:quantity].to_i
      @order = current_order
      @line_item = @order.line_items.new(
        product_id: params[:product_id],
        quantity: params[:quantity]
      )
      @order.save
      session[:order_id] = @order.id
      @line_item.unit_price = @product.price
      @line_item.total_price =
        @line_item.unit_price * @line_item.quantity
      @line_item.save
      redirect_to view_order_path
    else
      redirect_to @product, notice: "在庫が足りません"
    end
  end

  def view_order
    add_breadcrumb 'ショッピングカート'
    @order = current_order
    @line_items = @order.line_items.includes(product: :product_images)
    @order.sub_total = 0
    @line_items.each do |line_item|
        @order.sub_total += line_item.total_price
    end
    @order.tax = @order.sub_total * 0.08
    @order.grand_total = @order.sub_total + @order.tax
  end

  def update_cart
    @product = Product.find(params[:product_id])
    if @product.quantity >= params[:quantity].to_i
      @order = current_order
      @line_item = @order.line_items.find(params[:line_item_id])
      @line_item.quantity = params[:quantity].to_i
      @line_item.total_price =
        @line_item.unit_price * @line_item.quantity
      @line_item.save
      redirect_to view_order_path
    else
      redirect_to view_order_path, notice: "在庫が足りません"
    end
  end

  def delete_cart
    @order = current_order
    @line_item = @order.line_items.find(params[:line_item_id])
    @line_item.destroy
    redirect_to view_order_path
  end

  def checkout
    add_breadcrumb '注文画面'
    @line_items = current_order.line_items
    if @line_items.length != 0
      current_order.update(user_id: current_user.id, sub_total: 0)
      @order = current_order
      @line_items.each do |line_item|
        @order.sub_total += line_item.total_price
      end
      @order.tax = @order.sub_total * 0.08
      @order.grand_total = @order.sub_total + @order.tax
      @order.save
    end
  end

  def order_complete
    @order = current_order
    @line_items = @order.line_items
    @order.attributes = cust_info_params
    if @order.save(context: :order_complete)
      OrderMailer.send_when_order(current_user).deliver
      redirect_to products_path, notice: '注文が確定しました。'
      @line_items.each do |line_item|
        line_item.product.quantity -=line_item.quantity
        line_item.product.save
      end
      session[:order_id] = nil
    else
      render :checkout
    end
  end

  private
  def cust_info_params
    params.require(:order).permit(
      :cust_name, :cust_tel, :cust_email, :cust_postal_code,
      :cust_prefecture, :cust_city, :cust_street
    )
  end

end
