class QuestionsController < ApplicationController

    def index
        questions = Question.all
        render json: questions, only: [:id, :text],
            include: [:questioner, :answerer, :answers]
    end

    def show
        question = Question.find(params[:id])
        render json: question, only: [:id, :text],
            include: [:questioner, :answerer, :answers]
    end

    def create
        question = Question.new(question_params)

        if question.save
            render json: question
        else
            render json: question.errors.full_messages
        end
    end

    def update
        question = Question.find(params[:id])

        if question.update(question_params)
            render json: question
        else
            render json: question.errors.full_messages
        end
    end

    def destroy
        question.destroy
    end

    private

    def question_params
        params.require(:question).permit(:text, :questioner, :answerer)
    end

end