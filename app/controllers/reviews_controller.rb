class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @movie = Movie.find(params[:movie_id])
    end
    
    def create
        @review = Review.new(review_params)
        @review.movie = Movie.find(params[:review][:movie_id])
        @review.user = User.find(params[:review][:user_id])
        if @review.save
            redirect_to user_path(helpers.current_user)
        else
            redirect_to movie_path(@review.movie)
        end
    end
    
    private
    
    def review_params
        params.require(:review).permit(:content)
    end
end
