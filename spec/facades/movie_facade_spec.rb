require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it '.get_top_rated' do
    top_rated = MovieFacade.get_top_rated

    expect(top_rated).to be_a Hash
  end

  it '.movie_info', :vcr do
    movie = MovieFacade.movie_info(120)

    expect(movie).to be_a(Movie)
  end
end