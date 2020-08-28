class UserSkillsController < ApplicationController

    def index
        userskills = UserSkill.all
        render json: userskills, only: [:id, :user, :skill], include: [:reviews]
    end

    def show
        userskill = UserSkill.find(params[:id])
        ender json: userskill, only: [:id, :user, :skill], include: [:reviews]
    end

    def create
        userskill = UserSkill.new(userskill_params)

        if userskill.save
            render json: userskill
        else
            render json: userskill.errors.full_messages
        end
    end

    def update
        userskill = UserSkill.find(params[:id])

        if userskill.update(userskill_params)
            render json: userskill
        else
            render json: userskill.errors.full_messages
        end
    end

    def destroy
        userskill.destroy
    end

    private

    def userskill_params
        params.require(:userskill).permit(:user, :skill)
    end
    
end
