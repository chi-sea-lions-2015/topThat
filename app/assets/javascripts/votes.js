$(document).ready(function(){

  $("#challenger_vote_link").click(function(e){
    e.preventDefault();
    // what the shit is stop propagation?
    e.stopPropagation();
      console.log($(this).attr('href'))
      $.ajax({
        url: $(this).attr('href'),
        method: $(this).attr('data-method'),
        data: $(this).serialize(),
        success: function(response){
           var vote = $(response).find("#challenger_votes");

           $("#challenger_votes").html(vote[0].innerText)
        }

      })
   });


   $("#challengee_vote_link").click(function(e){
    e.preventDefault();
    // what the shit is stop propagation?
    e.stopPropagation();
      console.log($(this).attr('href'))
      $.ajax({
        url: $(this).attr('href'),
        method: $(this).attr('data-method'),
        data: $(this).serialize(),
        success: function(response){
           var vote = $(response).find("#challengee_votes");
           $("#challengee_votes").html(vote[0].innerText)
        }

      })
   });


});
