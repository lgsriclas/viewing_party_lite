require 'rails_helper'

RSpec.describe 'TMDB Movie Service' do 
  # test structure that comes back from api call 
  #   1. test presence of keys
  #   2. test data type of values
  describe 'happy path' do 
    it 'can get top rated movies' do
      response = MovieService.top_rated_movies

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)

      first_movie = response[:results][0]

      expect(first_movie).to have_key(:title)
      expect(first_movie[:title]).to be_a(String)

      expect(first_movie).to have_key(:vote_average)
      expect(first_movie[:vote_average]).to be_a(Float)
    end 

    it 'can find movies based on a search string' do 
      response = MovieService.find_movies('lord')

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)

      first_movie = response[:results][0]

      expect(first_movie).to have_key(:title)
      expect(first_movie[:title]).to be_a(String)

      expect(first_movie).to have_key(:vote_average)
      expect(first_movie[:vote_average]).to be_a(Float)
    end 

    it 'can get a movie by id' do
      response = MovieService.get_movie(120)

      expect(response).to be_a(Hash)

      expect(response).to have_key(:id)
      expect(response[:id]).to be_an(Integer)

      expect(response).to have_key(:title)
      expect(response[:title]).to be_a(String)

      expect(response).to have_key(:runtime)
      expect(response[:runtime]).to be_an(Integer)

      expect(response).to have_key(:vote_average)
      expect(response[:vote_average]).to be_a(Float)

      expect(response).to have_key(:genres)
      expect(response[:genres]).to be_an(Array)
      expect(response[:genres][0]).to have_key(:name)
      expect(response[:genres][0][:name]).to be_a(String)

      expect(response).to have_key(:poster_path)
      expect(response[:poster_path]).to be_a(String)
    end 

    it "can get a movie's cast by movie id" do 
      response = MovieService.get_cast(120)

      expect(response).to be_a(Hash)
      expect(response[:cast]).to be_an(Array)

      member = response[:cast][0]

      expect(member).to have_key(:name)
      expect(member[:name]).to be_a(String)

      expect(member).to have_key(:character)
      expect(member[:character]).to be_a(String)
    end 

    it 'can get movie comments by movie id' do 
      response = MovieService.get_reviews(120)

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)

      review = response[:results][0]

      expect(review).to have_key(:author)
      expect(review[:author]).to be_a(String)

      expect(review).to have_key(:content)
      expect(review[:content]).to be_a(String)
    end 
  end 
end 