import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burg"
export default class extends Controller {
  connect() {

  const menuToggle = document.querySelector(".hamburger-menu");
  const menu = document.querySelector(".menu");

    menuToggle.addEventListener("click", () => {
      menuToggle.classList.toggle("burger-open");
      menu.classList.toggle("menu-open");
    });
  }

}
