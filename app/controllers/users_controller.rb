class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
   @user
  end

  def new
  end

  def create
    user = User.create!(user_params)
    if user.save
      flash[:alert] = "Welcome #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:alert] = "Welcome Back #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = "Please enter valid credentials."
      redirect_to "/login"
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