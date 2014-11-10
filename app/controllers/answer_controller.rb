class AnswerController < ApplicationController
  def show
    @game_state = GameState.instance

    if @game_state.starting?
      render "starting"
    elsif @game_state.audience_answering?
      if @game_state.current_question.was_answered_by?(request.remote_ip)
        render "please_wait"
      else
        render "audience_answering"
      end
    elsif @game_state.finished?
      if @game_state.audience_winner == request.remote_ip
        @won = true
      else
        @won = false
      end

      render "have_i_won"
    else
      render "please_wait"
    end
  end

  def reload_check
    @game_state = GameState.instance

    reload = nil
    if (@game_state.audience_answering? && !@game_state.current_question.was_answered_by?(request.remote_ip)) || @game_state.finished?
      reload = true
    end

    render json: {reload: reload}.to_json
  end

  def submit_answer
    @game_state = GameState.instance

    if @game_state.audience_answering?

      @question = @game_state.current_question

      unless @question.was_answered_by?(request.remote_ip)

        if(["A", "B", "C", "D"].include?(params[:answer_char]))
          @question.was_answered_by!(params[:answer_char], request.remote_ip)
          @given_answer = params[:answer_char]
          render "answer_saved"
        else
          render "error"
        end

      else
        render "already_answered"
      end

    else
      render "answer_too_late"
    end
  end
end
