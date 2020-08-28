class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews, only: [:id, :rating],
            include: [:review_giver, :review_receiver, :user_skill]
    end

    def show
        review = Review.find(params[:id])
        render json: review,
            include: [:review_giver, :review_receiver, :user_skill]
    end

    def create
        review = Review.new(review_params)

        if review.save
            render json: review
        else
            render json: review.errors.full_messages
        end
    end

    def update
        review = Review.find(params[:id])

        if review.update(review_params)
            render json: review
        else
            render json: review.errors.full_messages
        end
    end

    def destroy
        review.destroy
    end

    private

    def review_params
        params.require(:review).permit(:rating, :review_giver, :review_receiver, :user_skill)
    end
    
end
