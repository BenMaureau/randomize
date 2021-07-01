const initReveal = () => {
  const reveal = document.querySelector('.my-btn-reveal')
  if (reveal) {
    reveal.addEventListener('click', (event) => {
      const audio = new Audio('/assets/reveal.mp3');
      audio.play();
      const card = document.querySelector('.my-activity-card')
      event.preventDefault();
      card.classList.remove("activity-secret");
      const btnResa = document.getElementById('btn-booking-reservation');
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
