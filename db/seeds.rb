# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

apikey = "c01df668"

movies = [
    "Star Wars",
    "Lord of the Rings",
    "Batman",
    "Superman",
    "X-Men",
    "The Notebook",
    "Love Actually",
    "Die Hard",
    "Memento"
]

request = RestClient.get "http://www.omdbapi.com/?apikey=#{apikey}&s=#{movie_title}"

    def put_titles
        movies.each do |movie_title|
            request = RestClient.get "http://www.omdbapi.com/?apikey=c01df668&t=#{movie_title}"
            hash = JSON.parse(request)
            puts "#{hash["Title"]}, released #{hash["Released"]}"
        end
    end
