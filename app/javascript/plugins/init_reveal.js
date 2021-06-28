const initReveal = () => {
  const reveal = document.querySelector('.my-btn-reveal')
  if (reveal) {
    reveal.addEventListener('click', (event) => {
      const card = document.querySelector('.my-activity-card')
      event.preventDefault();
      card.classList.remove("activity-secret");
      const btnResa = document.getElementById('btn-booking-reservation');
      console.log(btnResa);
    })
  }
}

export { initReveal };


         // <script>
         //   const initReveal = () => {
         //    const reveal = document.querySelector('.my-btn-reveal')
         //    if (reveal) {
         //        const card = document.querySelector('.my-activity-card')
         //        event.preventDefault();
         //        card.classList.remove("activity-secret");
         //    }
         //  }
         // </script>
