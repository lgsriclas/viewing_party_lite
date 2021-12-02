require 'rails_helper'

Rspec.describe 'Movie Facade' do 
  it '.get_top_rated' do 
    top_rated = MovieFacade.get_top_rated

    expect(top_rated).to be_an(array)
  end 

  it '.movie_info' do, :vcr do
    movie = MovieFacade.movie_info(120)

    expect(movie).to be_a(Movie)
  end 
end 