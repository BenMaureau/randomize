const initReviewModal = () => {
  // Get the modal
  const btn = document.querySelectorAll(".my-btn-review");

  // All page modals
  const modals = document.querySelectorAll('.modal');

  // Get the <span> element that closes the modal
  const spans = document.getElementsByClassName("close");

  if (modals) {
  // When the user clicks the button, open the modal
  for (let i = 0; i < btn.length; i++) {
   btn[i].onclick = function(e) {
      e.preventDefault();
      const fieldset = document.querySelector("fieldset");
      const btn_review = document.querySelector(".my-btn-review-submit");
      fieldset.onclick = function() {
        btn_review.disabled=false;
      }
      const modal = document.querySelector(e.target.getAttribute("href"));
      modal.style.display = "block";
   }
  }

  // When the user clicks on <span> (x), close the modal
  for (let i = 0; i < spans.length; i++) {
   spans[i].onclick = function() {
      for (const index in modals) {
        if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
      }
   }
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
      if (event.target.classList.contains('modal')) {
       for (const index in modals) {
        if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
       }
      }
    }
  }
}

export { initReviewModal };
