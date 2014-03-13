$(function(){
  //more show ajax
  $("#more_show").click(function(){
    $.ajax({
      url: "/",
      type: "get",
      dataType: "html"
    }).done(function(data, status, xhr) {
      data == "" ? alert("Bweetは全て表示されました。") : $("#bweets").append(data);
    }).fail(function(data, status, xhr) {
      alert("error!");
    });
  });

  //bweet ajax
  $("#bweet_button").click(function(){
    var data = {"description": $("#bweet_description").val()};
    $.ajax({
      url: "/bweets/create",
      data: data,
      type: "post",
      dataType: "html"
    }).done(function(data, status, xhr) {
      $("#bweets").html(data);
      $("#bweet_description").val("");
      $("#bweet_description").focus();
    }).fail(function(data, status, xhr) {
      alert("error!");
    });
  });
});