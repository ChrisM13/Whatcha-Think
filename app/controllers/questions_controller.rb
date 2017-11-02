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
        if current_user.admin
            @questions = Question.find(params[:id])
            @answer = @questions.answers
        else
            questions = Question.where(survey_id: params[:id])
            @question = questions[params[:index].to_i]
            @answer = Answer.new
        end 
  
 

        # find the number of this question in the survey
        # question_index = _____
        # find the number of the next question in the survey
        # next_question_index = question_index + 1
        
        # find the id of that next question
        # survey_questions[next_question_index].id

        # make sure that next_question_index is not larger than survey_questions length


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