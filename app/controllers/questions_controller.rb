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
        # look for a query param for which question you want to go to
        # # if you didn't send me a number go to first question
        # # if no query param, assume you're going to the first question
        # question_id = params[:id]

        # @question = Question.find(question_id)
        # @survey = @question.survey
        # survey_questions = @survey.questions 

        # find the number of this question in the survey
        # question_index = _____
        # find the number of the next question in the survey
        # next_question_index = question_index + 1
        
        # find the id of that next question
        # survey_questions[next_question_index].id

        # make sure that next_question_index is not larger than survey_questions length

        @answer = Answer.new

        # render the page


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