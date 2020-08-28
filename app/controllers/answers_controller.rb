class AnswersController < ApplicationController

    def index
        answers = Answer.all
        render json: answers, only: [:id, :text],
            include: [:user, :question]
    end

    def show
        answer = Answer.find(params[:id])
        render json: answer, only: [:id, :text],
            include: [:user, :question]
    end

    def create
        answer = Answer.new(answer_params)

        if answer.save
            render json: answer
        else
            render json: answer.errors.full_messages
        end
    end

    def update
        answer = Answer.find(params[:id])

        if answer.update(answer_params)
            render json: answer
        else
            render json: answer.errors.full_messages
        end
    end

    def destroy
        answer.destroy
    end

    private

    def answer_params
        params.require(:answer).permit(:text, :user, :question)
    end
end
