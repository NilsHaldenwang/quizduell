class GameState < ActiveRecord::Base

  define_constants_for_attribute(:state,
                                 :showing_question,
                                 :showing_answer_a,
                                 :showing_answer_b,
                                 :showing_answer_c,
                                 :showing_answer_d,
                                 :starting,
                                 :audience_answering,
                                 :team_answering,
                                 :showing_team_answer,
                                 :showing_audience_answer,
                                 :showing_correct_answer,
                                 :assigning_points,
                                 :finished,
                                 :find_audience_winner)

  def GameState.instance
    GameState.first
  end

  def current_question
    Question.where(number: self.current_question_number).first
  end

  def list_of_possible_winners
    correct_answer_counts = Hash.new(0)

    Question.all.each do |q|
      q.answers.each do |a|
        if q.correct_answer == a.value
          correct_answer_counts[a.ip] += 1
        end
      end
    end

    correct_answer_counts.sort_by {|k, v| -v}
  end
end
