import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recent"
export default class extends Controller {
  connect() {

    // Get CSRF token from meta tag
    const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content");
    // open most recently clicked roll
    const recentRolls = document.querySelectorAll(".roll-item"); // get all the rolls
    recentRolls.forEach(element => {
      element.addEventListener("click", function() {
        // when a roll is clicked, save the id of the roll in localStorage
        localStorage.setItem("lastClickedElementId", element.id);
      });
    });

    // open most recently clicked frame
    window.addEventListener("load", () => {
      // when the page loads, get the id of the last clicked roll from localStorage
      const lastClickedElementId = localStorage.getItem("lastClickedElementId");
      // if there is a last clicked roll, click it
      const lastClickedElement = document.getElementById(lastClickedElementId);
      if (lastClickedElement) {
        lastClickedElement.click();
      }
    });
  }
}
