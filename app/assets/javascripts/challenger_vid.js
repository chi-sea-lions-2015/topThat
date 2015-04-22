$(document).ready(function (){

  $("#challenge_link").on("click", function(e){
    e.preventDefault()
    console.log("what?")   
    $link = $(this)

  $.ajax({
      url: $link.attr('href'),
      method: $link.attr('data-method'),
      success: function(response){
        vid_form = $(response).find("#new_video");
        $("#upload_challenge").html(vid_form)

      }




  })




    


  });
});