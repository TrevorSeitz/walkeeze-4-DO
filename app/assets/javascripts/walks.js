$(function() {
  // Paloma.start();
  attachListeners();
});
//
function attachListeners() {
  $("a.load_walks").on("click", function(e) {
    // alert("link clicked");
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      // console.log(data);
      // debugger;
      data.map(function(w) {
        $("div.walks").append(
          `<li>${w.date} @ ${w.time} with ${w.walker_name}</li>`
        );
      });
    });
    e.preventDefault();
  });
}
//
// $(function() {
//   $("load walks").on("click", function(e) {
//     alert("link clicked");
//     e.preventDefault();
//     debugger;
//   });
// });
