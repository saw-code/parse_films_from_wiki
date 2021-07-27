module Parser
  def self.parse_films
    doc = Nokogiri::HTML(URI.open('https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb'))
    xpath = doc.xpath('//*[@id="mw-content-text"]/div/table/tbody')
    xpath.css('td').map { |i| i.text.chomp }.each_slice(5).to_a.map { |i| i[1...-1] }
  end
end
