class MovieFacade
  class << self
    def get_top_rated
      MovieService.top_rated_movies
    end

    def find_movies(params)
      MovieService.find_movies(params)
    end
  end
end