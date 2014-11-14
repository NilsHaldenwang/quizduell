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
    render nothing: true, layout: false
  end

  def audience_answering
    render nothing: true, layout: false
  end

  def team_answering
    render nothing: true, layout: false
  end

  def showing_question
    render nothing: true, layout: false
  end

  def showing_answer_a
    render nothing: true, layout: false
  end

  def showing_answer_b
    render nothing: true, layout: false
  end

  def showing_answer_c
    render nothing: true, layout: false
  end

  def showing_answer_d
    render nothing: true, layout: false
  end

  def assigning_points
    gs = GameState.instance
    @team_answer = gs.current_question.team_answer
    @audience_answer = gs.current_question.audience_answer
    @current_question_number = gs.current_question_number

    cq = gs.current_question
    total_answers = cq.answers.count.to_f

    @percentage_a = (cq.answers.where(value: "A").count * 100 / total_answers).round
    @percentage_b = (cq.answers.where(value: "B").count * 100 / total_answers).round
    @percentage_c = (cq.answers.where(value: "C").count * 100 / total_answers).round
    @percentage_d = (cq.answers.where(value: "D").count * 100 / total_answers).round

    render :showing_audience_answer, layout: false
  end

  def finished
    points_team = GameState.instance.points_team
    points_audience = GameState.instance.points_audience

    if points_team > points_audience
      @win_notification = "Gewonnen haben: <br/> Die Profs".html_safe
    elsif points_audience > points_team
      @win_notification = "Gewonnen haben: <br/> Die Alumni".html_safe
    else
      @win_notification = "Unentschieden"
    end
  end

  def showing_team_answer
    @team_answer = GameState.instance.current_question.team_answer
    render :showing_team_answer, layout: false
  end

  def showing_audience_answer
    gs = GameState.instance
    cq = gs.current_question

    @team_answer = cq.team_answer
    @audience_answer = cq.audience_answer

    total_answers = cq.answers.count.to_f

    @percentage_a = (cq.answers.where(value: "A").count * 100 / total_answers).round
    @percentage_b = (cq.answers.where(value: "B").count * 100 / total_answers).round
    @percentage_c = (cq.answers.where(value: "C").count * 100 / total_answers).round
    @percentage_d = (cq.answers.where(value: "D").count * 100 / total_answers).round

    render :showing_audience_answer, layout: false
  end

  def showing_correct_answer
    gs = GameState.instance
    @team_answer = gs.current_question.team_answer
    @audience_answer = gs.current_question.audience_answer
    @current_question_number = gs.current_question_number

    cq = gs.current_question
    total_answers = cq.answers.count.to_f

    @percentage_a = (cq.answers.where(value: "A").count * 100 / total_answers).round
    @percentage_b = (cq.answers.where(value: "B").count * 100 / total_answers).round
    @percentage_c = (cq.answers.where(value: "C").count * 100 / total_answers).round
    @percentage_d = (cq.answers.where(value: "D").count * 100 / total_answers).round

    render :showing_correct_answer, layout: false
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
