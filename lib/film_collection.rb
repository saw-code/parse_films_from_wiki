require 'nokogiri'
require 'open-uri'
require_relative 'film'
require_relative 'films_parser'

class FilmCollection
  attr_reader :collection

  def self.films_collection
    collection = FilmsParser.films.map do |line|
      Film.new(line[0], line[2], line[1])
    end
    new(collection)
  end

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
