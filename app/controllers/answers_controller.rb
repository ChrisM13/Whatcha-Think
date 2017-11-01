class AnswersController < ApplicationController

    def create
        @answer = Answer.new(answer_params)
        @answer.question_id = params[:question_id]
        @answer.user = current_user
        @answer.save
        redirect_to question_path(@answer.question_id)

    end



    private
    
        def answer_params
            params.require(:answer).permit(:rating, :comment)
        end

end