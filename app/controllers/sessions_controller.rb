class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Welcome Back #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = "Please enter valid credentials."
      redirect_to "/dashboard"
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end