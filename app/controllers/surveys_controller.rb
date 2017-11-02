class SurveysController < ApplicationController
    before_action :authorize

    def index
        if current_user.admin
            @surveys = current_user.surveys
        else
            @surveys = Survey.all
        end
    end

    def new
        @survey = Survey.new
        @question = Question.new
    end

    def create
        @surveys = current_user.surveys
        @survey_create = User.find_by(admin: true).surveys << Survey.new(survey_params)
        redirect_to surveys_path

    end

    def show
        @survey = Survey.find(params[:id])
        @question = Question.new
        puts "This is the survey show page"
    end

    def destroy
        @survey = Survey.find(params[:id])
        @survey.destroy
        redirect_to surveys_path

      end


private

def survey_params
    params.require(:survey).permit(:name)
end
end