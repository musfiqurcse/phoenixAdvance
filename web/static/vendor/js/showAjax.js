$(document).ready(function(){
    $("#show").on("click", function(e){
      alert("Item Clicked");
      e.preventDefault();
      $.ajax({
      type: "post",
      url: "/api/user",
      dataType: "json",
      success: function(users){
        console.log(users)
      }
      });
    });
});
