require_relative 'film'
require 'nokogiri'
require 'open-uri'

class FilmCollection
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def self.from_wiki_top_250(collection_from_xpath)
    collection = collection_from_xpath.map do |line|
      Film.new(line[0], line[2], line[1])
    end
    new(collection)
  end

  def director
    @collection.map(&:director).uniq
  end

  def choice_director(director)
    @collection.select { |f| f.director == director }
  end

  def show_directors
    director.map.with_index do |director, index|
      "#{index + 1}: #{director}"
    end
  end
end
