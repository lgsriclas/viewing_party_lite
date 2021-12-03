require 'rails_helper'

RSpec.describe 'Movie Facade' do 
  it '.get_top_rated', :vcr do 
    top_rated = MovieFacade.get_top_rated

    expect(top_rated).to be_a(Hash)
  end 

  it '.find_movies', :vcr do
    movie = MovieFacade.find_movies("lord")

    expect(movie).to be_a(Hash)
  end 

  it '.movie_info', :vcr do
    movie = MovieFacade.movie_info(120)

    expect(movie).to be_a(Movie)
  end 
end 