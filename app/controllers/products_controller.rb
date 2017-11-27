class ProductsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,
                except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  add_breadcrumb '商品一覧', :products_path

  def index
    @products = Product.all.includes(:product_images)
                       .order(created_at: :desc)
                       .page(params[:page])
                       .search(params[:search])
  end

  def show
    add_breadcrumb '商品詳細'
    add_breadcrumb @product.name
    @line_item = current_order.line_items.includes(:product)
    @line_item_product_id = @line_item.pluck(:product_id)
  end

  def new
    add_breadcrumb '商品登録'
    @product = Product.new
  end

  def edit
    add_breadcrumb '商品編集'
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to @product, notice: '商品が作成されました。'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: '商品が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
      redirect_to products_path, notice: '商品が削除されました。'
  end

  private
    def set_post
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product)
            .permit(
              :name, :price, :description, :quantity, :user_id,
              :category_id,product_images_images: []
            )
    end

    def correct_user
      @product = Product.find(params[:id])
      if current_user.id != @product.user.id
        redirect_to root_path
      end
    end
end
