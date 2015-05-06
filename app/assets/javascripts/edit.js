// $(document).ready(function(e){

//   $(".edit-link").on("click", function(e){
//       e.preventDefault()


//       $.ajax({
//         url: $(this).attr("href"),
//         method: "GET",
//         success: function(response){
//           $edit_form = $(response).find(".edit_user")
//           $(".user-info").html($edit_form)
//         }
//       })

//   });


//   $(document).on("submit", ".edit_user", function(e){
//     e.preventDefault()
//     console.log("tired")
//     console.log()

//     $.ajax({
//       url: $(this).attr("action"),
//       method: $(this).attr("method"),
//       data: $(this).serialize(),
//       success: function(response){
//         console.log(response)
//          $user_new_info = $(response).find(".user-snippet")
//          console.log($user_new_info)
//          $(".user-info").html($user_new_info)


//       }
//     })

//   });

// });
