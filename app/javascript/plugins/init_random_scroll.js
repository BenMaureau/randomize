const initRandomScroll = () => {
  const btnNext = document.getElementById("next-btn");
  const btnRdm = document.getElementById("rdm-btn");

  const randomSectionMap = document.getElementById('section-map');
  const randomSectionMood = document.getElementById('mood-section');
  const randomSectionCustom1 = document.getElementById('section-custom-1');
  const randomSectionCustom2 = document.getElementById('section-custom-2');

  if (btnNext) {
    btnNext.addEventListener("click", (event) => {
      event.preventDefault();
      // console.log('click');
      // console.log(randomSectionMood.classList);
  
      if (randomSectionMood.classList.contains('display-none')) {
        randomSectionMood.classList.remove('display-none');
        btnRdm.classList.remove('display-none');
        btnNext.classList.add('display-none');
      } else if (randomSectionCustom1.classList.contains('display-none')) {
        randomSectionCustom1.classList.remove('display-none');
      } else {
        randomSectionCustom2.classList.remove('display-none');
        btnNext.classList.add('display-none');
        btnRdm.classList.remove('display-none');
      }
      window.scrollTo({ left: 0, top: document.body.scrollHeight, behavior: "smooth" });
      // randomSectionMood.classList.add('display-block');
  
      // console.log(randomSectionMood.classList);
      // mapDisplayed.classList.add('d-none');
      // scrollAction.classList.remove('d-none');
    })
  }
}
export { initRandomScroll };