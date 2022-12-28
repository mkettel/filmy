import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="roll"
export default class extends Controller {
  connect() {
    function showRoll(rollId) {
      var cameraId = $(event.target).data('camera-id');
      console.log("howdy from roll");
      $.ajax({
        type: 'GET',
        url: '/cameras/' + cameraID + '/rolls/' + rollId,
        success: function(response) {
          // update the page with the response
          $('.rolls-container').html(response);
        }
      });
    }
  }
}
