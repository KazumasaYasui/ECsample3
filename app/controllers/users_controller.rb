class UsersController < ApplicationController

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    add_breadcrumb "#{@user.name}の出品ページ"
    if current_user.admin?
      @products = @user.products
                       .includes(:product_images)
                       .page(params[:page]).per(24)
                       .order(created_at: :desc)
    end
  end

  def mypage
    @user = User.find(params[:id])
    add_breadcrumb "#{@user.name}のマイページ"
    if current_user.admin?
      @user_product = @user.products
                           .includes(line_items: :order)
    else
      @orders = @user.orders.includes(
        line_items: { product: :product_images }
      )
    end
  end

end
