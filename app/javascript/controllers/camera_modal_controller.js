import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="camera-modal"
export default class extends Controller {
  connect() {
    console.log("howdy");
  }
}
