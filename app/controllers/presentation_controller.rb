class PresentationController < ApplicationController
  def index
    render :index, layout: false
  end

  def view_state
    render json: {
      "view_state" => GameState.instance.state,
      "current_question_number" => GameState.instance.current_question_number
    }
  end

  def starting
    render nothing: true
  end

  def audience_answering
    render nothing: true
  end

  def team_answering
    render nothing: true
  end

  def showing_question
    render nothing: true
  end

  def showing_team_answer
    @team_answer = GameState.instance.current_question.team_answer
  end

  def showing_audience_answer
    @team_answer = GameState.instance.current_question.team_answer
    @audience_answer = GameState.instance.current_question.audience_answer
  end

  def showing_correct_answer
    gs = GameState.instance
    @team_answer = gs.current_question.team_answer
    @audience_answer = gs.current_question.audience_answer
    @current_question_number = gs.current_question_number
  end

  def points_and_rounds
    gs = GameState.instance
    render json: {
      round_number: gs.current_question_number,
      team_score: gs.points_team,
      audience_score: gs.points_audience
    }
  end
end
