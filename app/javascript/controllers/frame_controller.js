import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const input = document.querySelectorAll("input[type=file]");
    const output = document.querySelectorAll("output");
    let imgArray = Array.from(input).map(() => []);

    input.forEach((input, i) => {
      input.addEventListener("change", function() {
        const file = input.files;
        imgArray[i].push(file[0]);
        displayImages(i);
      });
    });
    // for each file that is added to the array, it goes through and creates a litle URL for the image and adds the HTML to the images variable
    // No URL at the moment because that breaks it
    function displayImages(i) {
      let images = ""
      imgArray[i].forEach((image, index) => {
        images += `<div class="image">
        <img src="#" alt="image">
        <span onClick="deleteImage(${index})">&times;</span>
        </div>`
      })
      output[i].innerHTML = images;
    }

    function deleteImage(index) {
      imgArray.splice(index, 1)
      displayImages()
    }
  }
}
