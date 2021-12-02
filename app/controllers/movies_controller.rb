class MoviesController < ApplicationController
  def discover
    @user_id = params[:id]
  end

  def index
    if params["q"] == "top_rated"
      @movies = MovieFacade.get_top_rated
      @user_id = params[:id]
    else
      @movies = MovieFacade.find_movies(params["movie_title"])
      @user_id = params[:id]
    end
  end

  def show 
    @movie = MovieFacade.movie_info(params[:movie_id])
    @user_id = params[:id]
  end 
end