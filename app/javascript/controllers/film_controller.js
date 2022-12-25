import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="film"
export default class extends Controller {
  connect() {
    console.log("howdy");
    // Film Rolls Index Page

    const container = document.querySelector(".roll-list");
    const items = document.querySelectorAll(".roll-item");
    // const addButton = document.querySelector

    container.addEventListener("click", (event) => {
      let element = event.target
      element.classList.toggle("active");

      // To get the id of the roll that is selected
      let filmId = element.getAttribute("id");
      console.log(filmId);

      // should grab all of the .active elements and then remove them when another is clicked
      var elements = container.querySelectorAll(".active");
      elements.forEach((el) => el.classList.remove("active"));
      element.classList.toggle("active");

    })
  }
}
