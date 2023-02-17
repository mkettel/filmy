import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="frame"
export default class extends Controller {
  connect() {
    const imageInput = document.getElementById('image');
    const imagePreview = document.getElementById('image-preview');

    imageInput.addEventListener('change', function() {
      const file = this.files[0];
      const reader = new FileReader();

      reader.addEventListener('load', function() {
        imagePreview.src = reader.result;
        imagePreview.style.display = 'block';
      });

      reader.readAsDataURL(file);
    });
  }
}
