import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from the Dashboard Stimulus controller")
    this.checkRoute();
  }

  checkRoute() {
    if (window.location.pathname.includes('companies/show')) {
      this.element.classList.remove('d-none');
    } else {
      this.element.classList.add('d-none');
    }
  }

  show() {
    console.log('Show function triggered');
    // Aquí podrías definir lo que quieres que suceda cuando se active el evento
  }
}
