class PartiesController < ApplicationController

  def new
    @movie = {movie_id: params[:movie_id], title: params[:title], duration: params[:duration], image: params[:image]}
    @user_id = params[:id]
    @users = User.all
  end

  def create
    Party.create!(party_params)
    redirect_to "/users/#{user.id}"
  end

  private
  def party_params
    params.permit(:movie_id, :movie_title, :user_id, :duration, :start_date, :start_time)
  end
end