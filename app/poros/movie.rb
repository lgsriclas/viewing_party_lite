class Movie
  attr_reader :movie_id,
              :movie_title,
              :duration,
              :vote_average,
              :genres,
              :summary
            
  def initialize(data)
    @movie_id = data[:movie_id]
    @movie_title = data[:title]
    @duration = data[:runtime]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @summary = data[:overview]
  end
end