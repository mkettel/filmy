import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editor"
export default class extends Controller {
  connect() {
    console.log("howdy");
    // Get CSRF token from meta tag
    const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content");

    const saveBtn = document.getElementById("save-btn");
    saveBtn.addEventListener("click", function() {

      // Get all the editable fields
      const editableFields = document.querySelectorAll("[contenteditable='true']");

      // Collect the changes made to each field
      const changes = {};
      editableFields.forEach(function(field) {
        const key = field.classList[0];
        const value = field.innerText;
        changes[key] = value;
      });
      console.log(editableFields);

      // Get the Roll ID (html element grab)
      const rollId = document.querySelector(".photo-row-container").getAttribute("data-roll-id");
      console.log(rollId);

      // Get the camera ID (from url)
      const urlParts = window.location.pathname.split('/');
      const cameraId = urlParts[2]; // camera_id is the 3rd segment in the URL
      console.log(cameraId);

      // Get the frame ID
      const frameId = document.querySelector(".frame").id;
      console.log(frameId);

      // Send the changes to the server
      const xhr = new XMLHttpRequest();
      const url = `/cameras/${cameraId}/rolls/${rollId}/frames/${frameId}`
      xhr.open("PATCH", url, true);
      xhr.setRequestHeader("Content-Type", "application/json");
      xhr.setRequestHeader("X-CSRF-Token", csrfToken); // Add CSRF token to header

      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          // handle success
        }
      };
      const data = { frame: changes };
      xhr.send(JSON.stringify(data));
    });
  }
}
