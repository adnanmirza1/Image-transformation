import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["preview"];

  preview(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = (e) => {
      this.previewTarget.src = e.target.result;
      this.previewTarget.style.display = "block";
    };
    reader.readAsDataURL(file);
  }
}
