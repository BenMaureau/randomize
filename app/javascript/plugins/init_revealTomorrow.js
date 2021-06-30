const initRevealTomorrow = () => {
  const cards = document.querySelectorAll('.my-card')
  if (cards) {
    for (let i = 0; i < cards.length; i++) {
      const dateBooking = cards[i].getAttribute('id');
      let today = new Date();
      const hh = String(today.getHours()).padStart(2, '0');
      const dd = String(today.getDate()).padStart(2, '0');
      const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
      const yyyy = today.getFullYear();

      today = yyyy + '-' + mm + '-' + dd;
      if (dateBooking < today) {
        cards[i].classList.remove("activity-secret");
      }
    }
  }
}

export { initRevealTomorrow }
