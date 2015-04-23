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
        $("#upload_challenger_videos").html(vid_form)
      }
  })
  });

  $(document).on("submit", ".new_video", function(e){
    e.preventDefault();
    console.log("click")
    console.log(this.action);
    console.log(this.method)
    var $form = $(this);


    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize(),
      success: function(response){
        list = $(response).find("#challenger_list")
        console.log(response)

         $("#upload_challenger_videos").html(list)
      }
    })

  });




});
