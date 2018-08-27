$(function() {
  // Paloma.start();
  attachListeners();
});
//

class Dog {
  constructor(name, breed, age, user_id) {
    this.name = name;
    this.breed = breed;
    this.age = age;
    this.user_id = user_id;
  }
  render() {
    // return "<li>" + this.name + "</li>";
    return this.name;
  }
}

function attachListeners() {
  // load scheduled walks for a dog
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

  // create a new dog
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

  // add a note to a scheduled walk
  $(".dog_note").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "patch",
      url: this.action,
      data: {
        dog_id: $(this)
          .find("#dog_id")
          .val(),
        note: $(this)
          .find("#note")
          .val()
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

  // show the dogs scheduled for a walk
  $(".walk_list").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      // debugger;
      let position = data.id;
      if (data.length > 0) {
        $(".dog_list" + position).append(
          `<p>The following dogs are booked for this walk!</p><ul>`,
          data.dogs.forEach(function(obj) {
            outerItem = document.getElementById("dogs_list" + position);
            var picked = (({ name, breed, age, user_id }) => ({
              name,
              breed,
              age,
              user_id
            }))(obj);
            var props = Object.values(picked);
            var current_dog = new Dog(props[0], props[1], props[2], props[3]);
            newListItem = document.createElement("li");
            newdiv = document.createElement("div");
            newListItem.innerHTML = current_dog.render();
            outerItem.appendChild(newListItem);
            newListItem.appendChild(newdiv);
          })
        );
        // var elements = ["rock", "paper", "scissor"];
        //
        // demoP = document.getElementById("demo");
        // elements.forEach(function(item, index) {
        //   newlistitem = document.createElement("li");
        //   newdiv = document.createElement("div");
        //   newdiv.setAttribute("style", "border: 5px solid black;");
        //   newdiv.setAttribute("id", "div_demo");
        //
        //   newdiv.innerHTML = "index[" + index + "]: " + item + "<br>";
        //
        //   demoP.appendChild(newlistitem);
        //   newlistitem.appendChild(newdiv);
        // });
        // );
      }
    });
  });
  // next listener here
}
