class PresentationController < ApplicationController
  def index
    render :index, layout: false
  end

  def view_state
    render json: { "view_state" => GameState.instance.state }
  end

  def starting
    render text: "STARTING"
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
