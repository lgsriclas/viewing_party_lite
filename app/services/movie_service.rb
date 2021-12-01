class MovieService
  class << self
    def top_rated_movies
      response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
      parse_data(response)
    end

    def find_movies(params)
      response = conn.get("/3/search/movie?api_key=#{movie_api_key}&query=#{params}")
      parse_data(response)
    end

    private
    def conn
      Faraday.new("https://api.themoviedb.org")
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end