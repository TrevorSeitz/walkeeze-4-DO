$(function() {
  attachListeners();
});

// create dog objects for "dogs booked on walk"
class Dog {
  constructor(name, breed, age, user_id) {
    this.name = name;
    this.breed = breed;
    this.age = age;
    this.user_id = user_id;
  }
  render() {
    return this.name;
  }
}

function attachListeners() {
  createListOfDogs();
  createNewDog();
  dogNote();
  showDogs();
  loadWalks();
}
