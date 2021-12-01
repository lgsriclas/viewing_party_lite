class Movie
  attr_reader :movie_id,
              :movie_title,
              :duration,
              :vote_average,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(data)
    @movie_id = data[:movie_id]
    @movie_title = data[:belongs_to_collection][:name]
    @duration = data[:]
    @vote_average = data[:]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast = data[:]
    @reviews = data[:]
  end
end