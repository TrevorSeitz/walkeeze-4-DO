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
      $(".new_dog").each(function() {
        this.reset();
      });
      $("div.returned_new_dog").append(
        `<ul>
        Congratulations on your new Dog ${data.name}
        <li>Breed: ${data.breed}</li>
        <li>Age: ${data.age}</li>
        <li>Notes: ${data.notes}</li>
        </ul>
        <p>Any More New Dogs?<p>`
      );
    });
  });

  $(".dog_note").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "patch",
      url: this.action,
      data: {
        dog_id: $(".dog_note :input#dog_id").val(),
        note: $(".dog_note :input#note").val()
      }
    }).done(function(data) {
      $("div.dog_notes").append(
        `<ul>
        Note Added!
          <li>Name: ${data.dog_name}</li>
          <li>Note: ${data.dog_walk.notes}</li>
        </ul>`
      );
    });
  });
  $(".walk_list").on("click", function(e) {
    // debugger;
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      let position = data.id;
      if (data.participants.length > 0) {
        debugger;
        $(".dog_list" + position).append(
          `<p>The following dogs are booked for this walk!</p>`,
          // $("data").each(function(data) {
          `<li>${data.participants},  </li>`
        );
      }
    });
  });
  // });
  // next listener here
}
