class SkillsController < ApplicationController

    def index
        skills = Skill.all
        render json: skills, only: [:id, :name], include: [:users]
    end

    def show
        skill = Skill.find(params[:id])
        render json: skill, only: [:id, :name], include: [:users]
    end

    def create
        skill = Skill.new(skill_params)

        if skill.save
            render json: skill
        else
            render json: skill.errors.full_messages
        end
    end

    def update
        skill = Skill.find(params[:id])

        if skill.update(skill_params)
            render json: skill
        else
            render json: skill.errors.full_messages
        end
    end

    def destroy
        skill.destroy
    end

    private

    def skill_params
        params.require(:skill).permit(:name)
    end

end
