class UsersController < ApplicationController
  add_breadcrumb 'マイページ'

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
