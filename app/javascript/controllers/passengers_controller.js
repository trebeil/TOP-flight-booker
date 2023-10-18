import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'list' , 'button' ]

  connect() {
    this.manageRemoveButton ();
  }

  add() {
    let template = this.element.getElementsByTagName('template')[0];
    let clone = template.content.cloneNode(true);

    let ul = this.listTarget;
    ul.appendChild(clone);

    let passengerIndex = ul.getElementsByTagName('li').length - 1;
    let li = ul.children[passengerIndex];
    
    let nameLabel = li.children[0];
    nameLabel.setAttribute('for', `booking_passengers_attributes_${passengerIndex}_name`);

    let nameInput = li.children[1];
    nameInput.setAttribute('name', `booking[passengers_attributes][${passengerIndex}][name]`);
    nameInput.setAttribute('id', `booking_passengers_attributes_${passengerIndex}_name`);

    let emailLabel = li.children[2];
    emailLabel.setAttribute('for', `booking_passengers_attributes_${passengerIndex}_email`);

    let emailInput = li.children[3];
    emailInput.setAttribute('name', `booking[passengers_attributes][${passengerIndex}][email]`);
    emailInput.setAttribute('id', `booking_passengers_attributes_${passengerIndex}_email`);

    this.manageRemoveButton ();
  }

  remove () {
    let ul = this.listTarget;
    ul.lastElementChild.remove();
    this.manageRemoveButton();
  }

  manageRemoveButton() {
    let ul = this.listTarget;
    if (ul.children.length == 1) {
      this.buttonTarget.setAttribute('disabled', true);
    } else {
      this.buttonTarget.removeAttribute('disabled');
    }
  }
}
