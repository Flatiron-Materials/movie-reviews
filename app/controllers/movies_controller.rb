class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def new
        if params[:title]
            @movies = []
            search_movies(params[:title]).each do |movie_hash|
                movie = new_movie(movie_hash)
                @movies << movie
            end
        end
    end
    
    
    def create
        @movie = new_movie(find_movie(params[:title]))
        if @movie.save
            redirect_to movie_path(@movie)
        else
            redirect_to user_path(current_user)
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end

    private

    def movie_params

    end

    def search_movies(movie_title)
        request = RestClient.get "http://www.omdbapi.com/?apikey=c01df668&s=#{movie_title}&plot=full"
        api_hash = JSON.parse(request.body)
        search_results = api_hash["Search"]
    end

    def new_movie(api_hash)
        attributes = {}
        attributes[:title] = api_hash["Title"]
        attributes[:year] = api_hash["Year"]
        attributes[:rating] = api_hash["Rated"]
        attributes[:release_date] = api_hash["Released"]
        attributes[:runtime] = api_hash["Runtime"]
        attributes[:genre] = api_hash["Genre"]
        attributes[:plot] = api_hash["Plot"]
        attributes[:awards] = api_hash["Awards"]
        attributes[:poster_url] = api_hash["Poster"]
        Movie.new(attributes)
    end

    def find_movie(movie_title)
        request = RestClient.get "http://www.omdbapi.com/?apikey=c01df668&t=#{movie_title}&plot=full"
        api_hash = JSON.parse(request.body)
    end
end
