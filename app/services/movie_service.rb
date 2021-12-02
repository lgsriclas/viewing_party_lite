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

    def get_movie(movie_id)
      response = conn("https://api.themoviedb.org/3/movie/#{movie_id}").get do |x|
        x.params['api_key'] = ENV['movie_api_key']
      end
      parse_data(response)
    end

    def get_cast(movie_id)
      response = conn("https://api.themoviedb.org/3/movie/#{movie_id}/credits").get do |x|
        x.params['api_key'] = ENV['movie_api_key']
      end
      parse_data(response)
    end

    def get_reviews(movie_id)
      response = conn("https://api.themoviedb.org/3/movie/#{movie_id}/reviews").get do |x|
        x.params['api_key'] = ENV['movie_api_key']
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