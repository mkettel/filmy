import { Controller } from "@hotwired/stimulus"


// Attempt to make a vertical scroll element where the middle of the element gets an active class

// Connects to data-controller="camera"
export default class extends Controller {
  connect() {
    console.log("howdy");
    // camera index page
    const container = document.querySelector(".camera-list");
    const items = document.querySelectorAll(".camera-item");
    const film = document.querySelector(".filmButton");
    const deleteButton = document.querySelector("#deleteButton");

    // This allows us to click a camera and then it gets an active class like it is selected
    // I can elaborate on this idea to get data then like rolls that the camera has as well in the future
    container.addEventListener("click", (event) => {        // The container is the camera-item div.
      let element = event.target;
      element.classList.toggle("active");
      var cameraId = element.getAttribute("id"); //this gets the id of the camera that is selected
      console.log(cameraId);
      var elements = container.querySelectorAll(".active");
      elements.forEach((el) => el.classList.remove("active"));
      element.classList.toggle("active");

      // updates the url for the film button so it goes to the correct roll index page for the camera of choice
      filmButton.href = "cameras/" + cameraId + "/rolls";
      // deleteButton.href = "cameras/" + cameraId;

    });


    //  // Add a click event listener to the delete button
    //  deleteButton.addEventListener("click", (event) => {
    //   // $.ajaxSetup({
    //   //   headers: {
    //   //     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    //   //   }
    //   // });
    //   event.preventDefault(); // Prevent the default form submission
    //   if (confirm("Are you sure you want to delete this camera?")) {
    //     const cameraId = document.querySelector(".active").getAttribute("id");
    //     const url = `/cameras/${cameraId}`;
    //     // const url = deleteButton.href;
    //     fetch(url, { method: "DELETE" })
    //       .then((response) => {
    //         if (response.ok) {
    //           window.location.reload();
    //         } else {
    //           throw new Error("Failed to delete camera");
    //         }
    //       })
    //       .catch((error) => {
    //         console.error(error);
    //         alert(error.message);
    //       });
    //   }
    // });
  }
}


// Instead of having a button that says "go to film" i can just have the picture of the camera also be clickable and that is what the user can use to navigate to the camera specific rolls
