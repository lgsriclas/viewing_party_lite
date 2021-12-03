class MovieService
  class << self
    def top_rated_movies
      response = conn.get("/3/movie/top_rated")
      parse_data(response)
    end

    def find_movies(find)
      response = conn.get("/3/search/movie?query=#{find}")
      parse_data(response)
    end

    def get_movie(movie_id)
      response = conn.get("/3/movie/#{movie_id}")
      parse_data(response)
    end

    def get_cast(movie_id)
      response = conn.get("/3/movie/#{movie_id}/credits")
      parse_data(response)
    end

    def get_reviews(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews")
      parse_data(response)
    end

    private
    def conn
      Faraday.new("https://api.themoviedb.org") do |x|
        x.params['api_key'] = ENV['movie_api_key']
      end 
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end