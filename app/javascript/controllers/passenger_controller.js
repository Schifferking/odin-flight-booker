import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "passenger" ]

  initialize() {
    this.template = this.formTarget
  }

  add() {
    console.log("7")
  }
}
