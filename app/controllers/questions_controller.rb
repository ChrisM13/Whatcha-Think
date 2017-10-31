class QuestionsController < ApplicationController

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.survey_id = params[:survey_id]
        @question.save
        redirect_to survey_path(params[:survey_id])
    end

    def show

    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to survey_path(@question.survey_id)

    end

    private

    def question_params
        params.require(:question).permit(:content)
    end
end