class MoviesController < ApplicationController
  def discover
  end

  def index
    if params["q"] == "top_rated"
      @movies = MovieFacade.get_top_rated
    else
      @movies = MovieFacade.find_movies(params["movie_title"])
    end
  end
end