module WikiParser
  def self.parse_films
    url = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'

    doc = Nokogiri::HTML(URI.open(url))
    xpath = doc.xpath('//*[@id="mw-content-text"]/div/table/tbody')
    xpath.css('td').map { |i| i.text.chomp }.each_slice(5).map { |i| i[1...-1] }
  end
end
