class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all.page(params[:page] || 0).per(params[:per_page] || 10)
  end

  def show
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end
