class MovieService
  class << self
    def top_rated_movies
      response = conn("https://api.themoviedb.org/3/movie/top_rated").get do |x|
        x.params['api_key'] = ENV['movie_api_key']
      end
      parse_data(response)
    end

    def find_movies(find)
      response = conn("https://api.themoviedb.org/3/search/movie").get do |x|
        x.params['api_key'] = ENV['movie_api_key']
        x.params['query'] = find
      end
      parse_data(response)
    end

    private
    def conn(url)
      Faraday.new(url)
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end