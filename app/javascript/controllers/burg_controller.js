import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burg"
export default class extends Controller {
  connect() {

  const menuToggle = document.querySelector(".burg-menu");
  const menu = document.querySelector(".menu");

    menuToggle.addEventListener("click", () => {
    menuToggle.classList.toggle("menu-open");
    menu.classList.toggle("menu-open");
    });
  }
}
