class AnswersController < ApplicationController

    def create
        cur_index = params[:index].to_i + 1
        @answer = Answer.new(answer_params)
        @question = Question.find(params[:question_id])
        @answer.question = @question
        @answer.user = current_user
        @answer.save
        # determine if last question
        num_questions = Survey.find(@question.survey_id).questions.count 
        if cur_index >= num_questions
            redirect_to surveys_path
        else
            redirect_to question_path(@question.survey, index: cur_index)
        end

    def edit
        
    end

    end



    private
    
        def answer_params
            params.require(:answer).permit(:rating, :comment)
        end

end