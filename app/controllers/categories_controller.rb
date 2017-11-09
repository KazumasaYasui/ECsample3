class CategoriesController < ApplicationController

  add_breadcrumb 'ブランド一覧', :categories_path

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    add_breadcrumb @category.brand
    @products = @category.products
                         .includes(:product_images)
                         .page(params[:page]).per(24)
                         .order(created_at: :desc)
  end
end
