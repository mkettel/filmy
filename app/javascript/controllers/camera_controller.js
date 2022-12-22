import { Controller } from "@hotwired/stimulus"


// Attempt to make a vertical scroll element where the middle of the element gets an active class

// Connects to data-controller="camera"
export default class extends Controller {
  connect() {
    console.log("howdy");
    const container = document.querySelector(".camera-list");
    const items = document.querySelectorAll(".camera-item");

    // This allows us to click a camera and then it gets an active class like it is selected
    // I can elaborate on this idea to get data then like rolls that the camera has as well in the future
    container.addEventListener("click", (event) => {
      let element = event.target;
      element.classList.toggle("active");
      var cameraId = element.getAttribute("id"); //this gets the id of the camera that is selected
      console.log(cameraId);
      var elements = container.querySelectorAll(".active");
      elements.forEach((el) => el.classList.remove("active"));
      element.classList.toggle("active");

      loadContent(cameraId);
    })


    // Could potentially get the data from the camera selected and use the params to navigate to the desired show page

    document.getElementById("showButton").addEventListener("click", function() {
      // get the selected camera element
      var selectedCamera = document.querySelector(".selected");
      if (selectedCamera) {
        // get the camera id from the element
        var cameraId = selectedCamera.getAttribute("camera_id");
        // create the show page url
        var showPageUrl = "http://example.com/cameras/" + cameraId;
        // navigate to the show page
        window.location = showPageUrl;
      }
    });
  }
}
