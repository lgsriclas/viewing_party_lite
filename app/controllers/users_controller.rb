class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    if session[:user_id]
      @user
    else
      flash[:alert] = "Please enter valid credentials"
      redirect to '/'
    end
  end

  def new
  end

  def create
    user = User.create!(user_params)
    if user.save
      flash[:alert] = "Welcome #{user.name}!"
      redirect_to "/dashboard"
    else
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end