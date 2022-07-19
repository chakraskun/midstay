import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.modal = document.querySelector(this.data.get('target'))
  }

  handleClick() {
    $(`${this.data.get('target')}`).on('hidden.bs.modal', function(){
      $(this).find('form')[0].reset();
    });
    this.modal.classList.remove('show')
    this.modal.removeAttribute("style");
    document.body.classList.remove('modal-open')
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}
