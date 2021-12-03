class Movie
  attr_reader :movie_id,
              :movie_title,
              :duration,
              :vote_average,
              :genres,
              :summary,
              :cast,
              :reviews,
              :image

  def initialize(data, data_2, data_3)
    @movie_id = data[:id]
    @movie_title = data[:title]
    @duration = data[:runtime]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @summary = data[:overview]
    @cast = characters(data_2)
    @reviews = review(data_3)
    @image = data[:poster_path]
  end

  def characters(data)
    new_array = []
    count = 0
      data[:cast].each do |member|
        break if count >= 10
        new_array.push( {name: member[:name], character: member[:character]} )
        count += 1
      end
    new_array
  end

  def review(data)
    new_array = []
    data[:results].each do |review|
      new_array.push( {author: review[:author], content: review[:content] } )
    end
    new_array
  end
end