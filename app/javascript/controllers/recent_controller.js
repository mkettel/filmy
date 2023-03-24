import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recent"
export default class extends Controller {
  connect() {

    // Get CSRF token from meta tag
    const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content");
    // open most recently clicked roll
    const recentRolls = document.querySelectorAll(".roll-item");
    recentRolls.forEach(element => {
      element.addEventListener("click", function() {
        localStorage.setItem("lastClickedElementId", element.id);
      });
    });

    window.addEventListener("load", () => {
      const lastClickedElementId = localStorage.getItem("lastClickedElementId");
      const lastClickedElement = document.getElementById(lastClickedElementId);
      if (lastClickedElement) {
        lastClickedElement.click();
      }
    });
  }
}
