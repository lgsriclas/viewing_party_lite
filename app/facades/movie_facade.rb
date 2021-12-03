class MovieFacade
  class << self
    def get_top_rated
      MovieService.top_rated_movies
    end

    def find_movies(params)
      MovieService.find_movies(params)
    end

    def movie_info(movie_id)
      data = MovieService.get_movie(movie_id)
      data_2 = MovieService.get_cast(movie_id)
      data_3 = MovieService.get_reviews(movie_id)
      Movie.new(data, data_2, data_3)
    end 
  end
end