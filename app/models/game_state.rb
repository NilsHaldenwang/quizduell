class GameState < ActiveRecord::Base

  define_constants_for_attribute(:state, :starting, :audience_answering, :team_answering, :showing_team_answer, :showing_audience_answer, :show_correct_answer, :finished)

  def GameState.instance
    GameState.first
  end

  def current_question
    Question.where(number: self.current_question_number)
  end

end
