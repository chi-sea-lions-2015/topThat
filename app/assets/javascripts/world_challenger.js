$(document).ready(function(){

    $(".world-challenger").on("click", function(e){
      e.preventDefault()

      $.ajax({
        url: $(this).attr("href"),
        method: "GET",
        success: function(response){
          vid_form = $(response).find("#new_video");
          $("#upload_challenger_videos").html(vid_form)
        }

      });

    });


  $(document).on("submit", ".new_video", function(e){
      e.preventDefault()
      console.log("hola")

  $.ajax({
      url: $(this).attr("action"),
      method: $(this).attr("method"),
      data: $(this).serialize(),
      success: function(response){
      list = $(response).find("#upload_challenger_videos")
      console.log(response)
      $("#upload_challenger_videos").html(list)
    }
    })
  });
});
