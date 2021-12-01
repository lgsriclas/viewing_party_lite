class MoviesController < ApplicationController
  def discover
  end

  def index
    if "q = top_rated"
      @top_rated_movies = MovieFacade.get_top_rated
    elsif params[:search]
      @find_movies = MovieFacade.find_movies
    end
  end
end