const initRandomScroll = () => {
  const btnNext = document.getElementById("next-btn");
  const btnRdm = document.getElementById("rdm-btn");

  const randomSectionMap = document.getElementById('section-map');
  const randomSectionMood = document.getElementById('mood-section');
  const randomSectionCustom1 = document.getElementById('section-custom-1');
  const randomSectionCustom2 = document.getElementById('section-custom-2');
  const imageShy = document.querySelector(".img-shy");
  const imageAdv = document.querySelector(".img-adventure");

  const markers = document.querySelectorAll('.marker');

  if (markers) {
    markers.forEach(marker => {
      marker.addEventListener('click', (event) => {
        randomSectionMood.classList.remove('display-none');
        randomSectionMood.scrollIntoView({behavior: "smooth"})
      });
    });
  }

  if (btnNext) {
    btnNext.addEventListener("click", (event) => {
      event.preventDefault();
      if (imageShy.classList.contains('active-mood-card')) {
        btnNext.classList.remove('display-none');
        btnRdm.classList.add('display-none');
      }
      else {
        btnNext.classList.add('display-none');
        btnRdm.classList.remove('display-none');
      }


      if (randomSectionMood.classList.contains('display-none')) {
        randomSectionMood.classList.remove('display-none');

      } else if (randomSectionCustom1.classList.contains('display-none')) {
        randomSectionCustom1.classList.remove('display-none');
      } else {
        randomSectionCustom2.classList.remove('display-none');
        btnNext.classList.add('display-none');
        btnRdm.classList.remove('display-none');

      }
      window.scrollTo({ left: 0, top: document.body.scrollHeight, behavior: "smooth" });
    })
  }
}
export { initRandomScroll };


