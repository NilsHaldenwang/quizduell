class GameState < ActiveRecord::Base

  define_constants_for_attribute(:state,
                                 :showing_question,
                                 :starting,
                                 :audience_answering,
                                 :team_answering,
                                 :showing_team_answer,
                                 :showing_audience_answer,
                                 :showing_correct_answer,
                                 :finished)

  def GameState.instance
    GameState.first
  end

  def current_question
    Question.where(number: self.current_question_number).first
  end

end
