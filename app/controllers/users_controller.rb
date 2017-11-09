class UsersController < ApplicationController

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    add_breadcrumb "#{@user.name}のマイページ"
    @products = @user.products
                     .includes(:product_images)
                     .page(params[:page])
                     .order(created_at: :desc)
  end
end
