class AddQuestionsToSurvey < ActiveRecord::Migration[5.1]
  def change
    add_reference :surveys, :question, foreign_key: true
  end
end
