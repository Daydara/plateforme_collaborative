class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_products = @user.products
  end
end
