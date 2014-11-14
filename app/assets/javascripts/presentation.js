var current_state = "";
var loaded = true;

var observe_view_state = function(){
  $.getJSON('view_state', function (data) {
    if(data.view_state !== current_state) {
      if(loaded){
        if(data.view_state != 'showing_correct_answer' || data.view_state != 'starting' || data.view_state == 'finished'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'.jpg")');
        }

        if(data.view_state == 'starting'){
          $('body').css('background-image', 'url("/assets/titel.jpg")');
        }

        if(data.view_state == 'finished'){
          $('body').css('background-image', 'url("/assets/hintergrund.jpg")');
        }

        if(data.view_state == 'showing_correct_answer' || data.view_state == 'assigning_points'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'_antwort.jpg")');
        }

        if(data.view_state == 'showing_answer_a'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'a.jpg")');
        }

        if(data.view_state == 'showing_answer_b'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'b.jpg")');
        }

        if(data.view_state == 'showing_answer_c'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'c.jpg")');
        }

        if(data.view_state == 'showing_answer_d' || data.view_state == 'showing_team_answer' || data.view_state == 'showing_audience_answer' || data.view_state == 'showing_correct_answer' || data.view_state == 'assigning_points'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'d.jpg")');
        }

      }

      loaded = false;

      current_state = data.view_state;

      $.ajax({
        url: current_state
      }).done(function(html){

        // if(data.view_state != 'showing_question' && data.view_state != "audience_answering" && data.view_state != "team_answering"){
          $("#ajax-container").html(html);
        // }

        if(data.view_state == 'showing_question'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'.jpg")');
        }

        if(data.view_state == 'showing_correct_answer'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'_antwort.jpg")');
        }

        if(data.view_state == 'finished'){
          $('body').css('background-image', 'url("/assets/hintergrund.jpg")');
        }

        if(data.view_state == 'showing_answer_a'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'a.jpg")');
        }

        if(data.view_state == 'showing_answer_b'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'b.jpg")');
        }

        if(data.view_state == 'showing_answer_c'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'c.jpg")');
        }

        if(data.view_state == 'showing_answer_d'){
          $('body').css('background-image', 'url("/assets/frage'+ data.current_question_number +'d.jpg")');
        }


        //change round if needed and update points
        observe_points_and_round();

      });
    }
  });
};

var observe_points_and_round = function(){
  $.getJSON('points_and_rounds', function(data){
    $("#team_score").text(data.team_score);
    $("#audience_score").text(data.audience_score);
    $("#round_number").text(data.round_number);
  });
}

$(function(){
  setInterval(observe_view_state, 1000);
});
