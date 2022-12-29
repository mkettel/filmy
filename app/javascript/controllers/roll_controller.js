import { Controller } from "@hotwired/stimulus"

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

        // Make the AJAX request to fetch the data for the roll
        var xhr = new XMLHttpRequest();
        xhr.open("GET", '/cameras/' + cameraId + '/rolls/' + rollId, true);
        xhr.setRequestHeader("Content-Type", "application/html");
        xhr.onload = function (e) {
          if (xhr.readyState === 4) {
            if (xhr.status === 200) {
              // Replace the content of the rolls-content-container element with the data returned from the server
              document.querySelector('.rolls-content-container').innerHTML = xhr.responseText;
            } else {
              console.error(xhr.statusText);
            }
          }
        };
        xhr.onerror = function (e) {
          console.error(xhr.statusText);
        };
        xhr.send(null);
      });
    }
  }
}
