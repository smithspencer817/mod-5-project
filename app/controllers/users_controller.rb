class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: [:id, :name],
            include: [:skills, :received_reviews, :given_reviews, :received_questions, :posed_questions, :answers]
    end

    def show
        user = User.find(params[:id])
        render json: user, only: [:id, :name],
            include: [:skills, :received_reviews, :given_reviews, :received_questions, :posed_questions, :answers]
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages
        end
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages
        end
    end

    def destroy
        user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end