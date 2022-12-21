import { Controller } from "@hotwired/stimulus"


// Attempt to make a vertical scroll element where the middle of the element gets an active class

// Connects to data-controller="camera"
export default class extends Controller {
  connect() {
    console.log("howdy");
    const container = document.querySelector(".camera-list");
    const items = document.querySelectorAll(".camera-item");

    // container.addEventListener("scroll", () => {
    //   const scrollTop = container.scrollTop;
    //   const containerHeight = container.clientHeight;
    //   const middle = scrollTop + (containerHeight / 2);

    //   for (const item of items) {
    //     const top = item.offsetTop;
    //     console.log(top);
    //     const height = item.offsetHeight;
    //     const bottom = top + height;

    //     if (top <= middle && middle <= bottom) {
    //       // item is in the middle of the container
    //       console.log("howdy");
    //       item.classList.add("active");
    //     } else {
    //       item.classList.remove("active");
    //     }
    //   }
    // });

    // This allows us to click a camera and then it gets an active class like it is selected
    // I can elaborate on this idea to get data then like rolls that the camera has as well in the future
    container.addEventListener("click", (event) => {
      let element = event.target;
      element.classList.toggle("active");
    })
  }
}
