import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview"];

  connect() {
    this.inputTargets.forEach((input) => {
      input.addEventListener("change", () => {
        const id = input.dataset.frameId;
        const img = this.previewTarget.find(`#image-preview-${id}`)[0];

        if (input.files && input.files[0]) {
          const reader = new FileReader();

          reader.onload = function(e) {
            img.src = e.target.result;
            img.style.display = "block";
          };

          reader.readAsDataURL(input.files[0]);
        }
      });
    });
  }
}
