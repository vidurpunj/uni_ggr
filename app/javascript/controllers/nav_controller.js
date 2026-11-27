import { Controller } from "@hotwired/stimulus"

// Toggles the mobile navigation menu.
export default class extends Controller {
  static targets = ["menu", "button"]

  toggle() {
    const open = this.menuTarget.classList.toggle("is-open")
    this.buttonTarget.setAttribute("aria-expanded", open)
  }

  close(event) {
    if (event.target.closest("a")) {
      this.menuTarget.classList.remove("is-open")
      this.buttonTarget.setAttribute("aria-expanded", "false")
    }
  }
}
