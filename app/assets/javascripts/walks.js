$(function() {
  // Paloma.start();
  attachListeners();
});
//
function attachListeners() {
  $("a.load_walks").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      if (data.length === 0) {
        $("div.walks").append(`<li>There are no walks scheduled.</li>`);
      } else {
        data.map(function(w) {
          $("div.walks").append(
            `<li>${w.date} @ ${w.time} with ${w.walker_name}</li>`
          );
        });
      }
    });
  });

  $(".new_dog").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: this.action,
      data: $(".new_dog :input")
    }).done(function(data) {
      console.log(data);
      // debugger;
      // $("div.returned_new_dog").append(`<li>${data}</li>`);
      $("div.returned_new_dog").append(
        `<ul>
        Congratulations on your new Dog ${data.name}
        <li>Breed: ${data.breed}</li>
        <li>Age: ${data.age}</li>
        <li>Notes: ${data.notes}</li>
        </ul>`
      );
    });
  });
  // next listener here
}
