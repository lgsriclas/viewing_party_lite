class MoviesController < ApplicationController
  def discover
  end

  def index
    @movies = MovieFacade.get_top_rated
  end
end