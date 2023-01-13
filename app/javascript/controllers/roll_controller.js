import { Controller } from "@hotwired/stimulus"

// This js controller is responsible for the AJAX request functionality for displaying the roll's frames when a roll is selected

// Connects to data-controller="roll"
export default class extends Controller {
  connect() {
    console.log("howdy");
    // Find all roll-item elements
    var rollItems = document.querySelectorAll('.roll-item');

    // Attach a click event listener to each roll-item element
    for (var i = 0; i < rollItems.length; i++) {
      rollItems[i].addEventListener('click', function() {
        // Get the camera_id and roll_id from the id attribute
        var parts = this.id.split('-');
        var cameraId = parts[1];
        var rollId = parts[2];

        // this is the fetch request for the ajax to get the various roll content
        fetch('/cameras/' + cameraId + '/rolls/' + rollId)
          .then(response => response.text())
          .then(html => {
            document.querySelector('.rolls-content-container').innerHTML = html;
          })
          .catch(error => console.error(error));
      });
    }
  }
}
