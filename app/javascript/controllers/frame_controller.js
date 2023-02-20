import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const input = document.querySelector("input");
    const output = document.querySelector("output");
    let imgArray = []

    input.addEventListener("change", function() {
      const file = input.files
      imgArray.push(file[0])
      displayImages()
    })

    function displayImages() {
      let images = ""
      imgArray.forEach((image, index) => {
        images += `<div class="image">
        <img src="${URL.createObjectURL(image)}" alt="image">
        <span onClick="deleteImage(${index})">&times;</span>
        </div>`
      })
      output.innerHTML = images
    }

    function deleteImage(index) {
      imgArray.splice(index, 1)
      displayImages()
    }
  }
}
