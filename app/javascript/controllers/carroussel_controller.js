import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carroussel"
export default class extends Controller {
  static targets = ["carousel"];

  connect() {
    this.startCarousel();
  }

  startCarousel() {
    this.interval = setInterval(() => {
      this.next();
    }, 3000); // Définit le délai entre chaque diapositive (3 secondes dans cet exemple)
  }

  stopCarousel() {
    clearInterval(this.interval);
  }

  next() {
    this.carouselTarget.scrollBy({
      left: window.innerWidth, // Fait défiler d'une largeur d'écran
      behavior: "smooth",
    });
  }

  previous() {
    this.carouselTarget.scrollBy({
      left: -window.innerWidth, // Fait défiler en arrière d'une largeur d'écran
      behavior: "smooth",
    });
  }
}
