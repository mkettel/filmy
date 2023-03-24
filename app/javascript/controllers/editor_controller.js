import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("howdy");
    // Get CSRF token from meta tag
    const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content");

    const saveBtns = document.querySelectorAll("#save-btn"); // get all the save buttons
    saveBtns.forEach(function(saveBtn) {                // loop through each save button
      saveBtn.addEventListener("click", function() {    // add a click event listener to each save button
        const rollId = document.querySelector(".photo-row-container").getAttribute("data-roll-id"); // get the roll id
        console.log(rollId);

        const urlParts = window.location.pathname.split('/'); // get the camera id
        const cameraId = urlParts[2]; // camera_id is the 3rd segment in the URL
        console.log(cameraId);

        const frame = saveBtn.closest('.frame'); // get the frame
        const frameId = frame.id; // get the frame id
        console.log(frameId);

        const editableFields = frame.querySelectorAll("[contenteditable='true']"); // get all the editable fields
        const changes = {}; // collect the changes made to each field
        editableFields.forEach(function(field) { // loop through each editable field
          const key = field.classList[0]; // get the class name
          const value = field.innerText; // get the inner text
          changes[key] = value; // add the key and value to the changes object
        });

        const xhr = new XMLHttpRequest(); // send the changes to the server
        const url = `/cameras/${cameraId}/rolls/${rollId}/frames/${frameId}` // build the url to send the changes to
        xhr.open("PATCH", url, true); // open the request
        xhr.setRequestHeader("Content-Type", "application/json");   // set the content type
        xhr.setRequestHeader("X-CSRF-Token", csrfToken); // Add CSRF token to header

        const toast = document.querySelector(".toast");  // show a toast notification
        toast.classList.remove('hidden');  // remove the hidden class
        toast.classList.add('show');  // add the show class

        setTimeout(function() {
          toast.classList.add('hidden');
        }, 2000);

        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
            // handle success
          };
        };
        const data = { frame: changes };
        xhr.send(JSON.stringify(data));
      });
    });
  }
}






// import { Controller } from "@hotwired/stimulus"


// // UPDATES THE FIELDS IN THE FRAMES AJAX STYLE MFER

// // Connects to data-controller="editor"
// export default class extends Controller {
//   connect() {
//     console.log("howdy");
//     // Get CSRF token from meta tag
//     const csrfToken = document.querySelector("meta[name=csrf-token]").getAttribute("content");

//     const saveBtn = document.getElementById("save-btn");
//     saveBtn.addEventListener("click", function() {

//       // Get all the editable fields
//       const editableFields = document.querySelectorAll("[contenteditable='true']");

//       // Collect the changes made to each field
//       const changes = {};
//       editableFields.forEach(function(field) {
//         const key = field.classList[0];
//         const value = field.innerText;
//         changes[key] = value;
//       });
//       console.log(editableFields);

//       // Get the Roll ID (html element grab)
//       const rollId = document.querySelector(".photo-row-container").getAttribute("data-roll-id");
//       console.log(rollId);

//       // Get the camera ID (from url)
//       const urlParts = window.location.pathname.split('/');
//       const cameraId = urlParts[2]; // camera_id is the 3rd segment in the URL
//       console.log(cameraId);

//       // Get the frame ID
//       const frameId = document.querySelector(".frame").id;
//       console.log(frameId);

//       // Send the changes to the server
//       const xhr = new XMLHttpRequest();
//       const url = `/cameras/${cameraId}/rolls/${rollId}/frames/${frameId}`
//       xhr.open("PATCH", url, true);
//       xhr.setRequestHeader("Content-Type", "application/json");
//       xhr.setRequestHeader("X-CSRF-Token", csrfToken); // Add CSRF token to header

//       // Show a toast notification
//       const toast = document.querySelector(".toast");
//       toast.classList.remove('hidden');
//       toast.classList.add('show');
//       // document.querySelector(".main-roll-container").appendChild(toast);

//       // Hide the toast after a short delay
//       setTimeout(function() {
//         toast.classList.add('hidden');
//       }, 2000);

//       xhr.onreadystatechange = function() {
//         if (xhr.readyState === 4 && xhr.status === 200) {
//           // handle success

//         };
//       };
//       const data = { frame: changes };
//       xhr.send(JSON.stringify(data));
//     });
//   }
// }
