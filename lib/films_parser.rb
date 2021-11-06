require 'nokogiri'
require 'open-uri'

module FilmsParser
  WIKI_URL = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'

  def self.films_from_wiki
    url = URI.escape(WIKI_URL)
    doc = Nokogiri::HTML(URI.open(url, &:read))

    films =
      doc.css('#mw-content-text div table tbody tr')[1..-1].map do |tr|
        data = tr.css('td').map { |td| td.text.strip }
        Film.new(data[1], data[3], data[2])
      end
    FilmCollection.new(films)
  end
end
