class FilmCollection
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def director
    @collection.map(&:director).uniq
  end

  def choice_director(director)
    @collection.select { |f| f.director == director }
  end

  def show_directors
    director.map.with_index(1) do |director, index|
      "#{index}: #{director}"
    end
  end
end
