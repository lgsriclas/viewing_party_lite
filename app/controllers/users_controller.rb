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
      flash[:alers] = "Please enter a valid name and email."
      redirect_to "/register"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end