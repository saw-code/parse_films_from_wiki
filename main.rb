require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/wiki_parser'

puts 'Программа "Фильм на вечер'
puts

collection_from_xpath = WikiParser.parse_films

collection = FilmCollection.from_wiki_top_250(collection_from_xpath)

puts collection.show_directors
puts
puts 'Фильм какого режиссёра хотите сегодня посмотреть?'

user_input = gets.to_i - 1
director = collection.director[user_input]
film_to_watch = collection.choice_director(director)
puts
puts 'Сегодня вечером рекомендую посмотреть:'
puts film_to_watch.sample
