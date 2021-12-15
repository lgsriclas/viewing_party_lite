class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
   @user
  end

  def new
  end

  def create
    user = User.create!(user_params)
    flash[:alert] = "Welcome #{user.name}!"
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end