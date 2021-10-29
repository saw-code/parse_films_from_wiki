module VideoParser
  URL = URI.escape('https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb')

  def self.films
    doc = Nokogiri::HTML(URI.open(URL, &:read))

    doc.css('#mw-content-text div table tbody td').map do |i|
      i.text.chomp
    end.each_slice(5).map { |i| i[1...-1] }
  end
end
