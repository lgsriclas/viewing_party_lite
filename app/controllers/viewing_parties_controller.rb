class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.movie_info(params[:movie_id]) 
  end

  def create
    ViewingParty.create!(vp_params)
  end
end