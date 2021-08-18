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

    def request_movie(apikey, movie_title)
        request = RestClient.get "http://www.omdbapi.com/?apikey=#{apikey}&t=#{movie_title}&plot=full"
        api_hash = JSON.parse(request)
    end

    def build_movie(api_hash)
        title = api_hash["Title"]
        year = api_hash["Year"]
        release_date = api_hash["Released"]
        plot = api_hash["Plot"]
        Movie.create(title: title, year: year, release_date: release_date, plot: plot)
    end
