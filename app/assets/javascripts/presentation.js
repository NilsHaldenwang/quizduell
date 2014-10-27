var current_state = "";

var observe_view_state = function(){
  $.getJSON('view_state', function (data) {
    if(data.view_state !== current_state) {
      current_state = data.view_state;

      $.ajax({
        url: current_state
      }).done(function(html){
        $("#ajax-container").html(html);

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
