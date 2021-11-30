class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:success] = "Welcome #{user.name}"
    redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Please enter a vaild name/email"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end