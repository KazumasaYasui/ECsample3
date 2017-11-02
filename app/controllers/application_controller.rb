class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_search

  add_breadcrumb 'Home', :root_path

  def set_search
    #@search = Article.search(params[:q])
    @search = Product.ransack(params[:q])
    @search_products = @search.result.order(created_at: :desc).page(params[:page])
  end
end

