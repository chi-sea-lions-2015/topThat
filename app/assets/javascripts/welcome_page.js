$(document).ready(function(){
  console.log("what?")

  $("#signup_button").on("click", function(e){
      e.preventDefault();
      console.log("ding")

    $.ajax({
      url: $("#signup_link").attr("href"),
      method: $("#signup_link").attr("method"),
      success: function(response){
        var signup_form = $(response).find("#sign_up_form");
           $("#opening_forms").html(signup_form[0])
      }
    })
  });




  $("#login_button").on("click", function(e){
      e.preventDefault();

      $.ajax({
        url: $("#login_link").attr("href"),
        method: $("#login_link").attr("method"),
        success: function(response){
          var login_form = $(response).find("#login_form");
            $("#opening_forms").html(login_form[0])
        }

      })
  });


});
