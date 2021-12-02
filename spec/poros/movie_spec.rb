require 'rails_helper'
# testing guide:
# 1.methods that are in poro
# 2. attributess that are in poro
RSpec.describe Movie do 
  it 'has attributes' do 
    movie = Movie.new(dat, data_2, data_3) # data from rails helper file

    expect(movie.movie_id).to eq("find actual result from rails helper method data")
    expect(movie.movie_title).to eq("movie title from rails helper method")
  end 

  it 'has methods' do 
    # test methods from poro
  end 
end 