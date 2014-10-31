class AdminController < ApplicationController
  before_filter :authenticate

  def index
    @game_state = GameState.instance
    render :index
  end

  def next_question
    gs = GameState.instance

    current_question_number = gs.current_question_number

    gs.update_attribute(:current_question_number, current_question_number + 1)
    gs.update_attribute(:state, GameState::STATE_SHOWING_QUESTION)

    redirect_to action: :index
  end

  def change_state
    gs = GameState.instance
    gs.update_attribute(:state, params[:state])

    redirect_to action: :index
  end

  def note_team_answer
    gs = GameState.instance

    gs.current_question.update_attribute(:team_answer, params[:value])
    gs.showing_team_answer!

    redirect_to action: :index
  end

  def show_audience_answer
    gs = GameState.instance

    gs.current_question.compute_audience_answer!

    gs.showing_audience_answer!

    redirect_to action: :index
  end

  def show_correct_answer

    gs = GameState.instance
    current_question = gs.current_question

    if current_question.team_answer == current_question.correct_answer
      gs.update_attribute(:points_team, gs.points_team + 1)
    end

    if current_question.audience_answer == current_question.correct_answer
      gs.update_attribute(:points_audience, gs.points_audience + 1)
    end

    GameState.instance.showing_correct_answer!

    redirect_to action: :index
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == "druecker" && password == "alumnusim"
    end
  end
end
