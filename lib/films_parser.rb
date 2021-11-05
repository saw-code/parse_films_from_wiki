require 'nokogiri'
require 'open-uri'

module FilmsParser
  WIKI_URL = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'

  def self.films_from_wiki
    url = URI.escape(WIKI_URL)
    doc = Nokogiri::HTML(URI.open(url, &:read))

    collection = doc.css('#mw-content-text div table tbody td').map do |i|
      i.text.chomp
    end.each_slice(5).map { |i| i[1...-1] }.map do |line|
      Film.new(line[0], line[2], line[1])
    end
    FilmCollection.new(collection)
  end
end
