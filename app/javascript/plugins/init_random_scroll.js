const initRandomScroll = () => {
  const btnNext = document.getElementById("next-btn");
  const btnRdm = document.getElementById("rdm-btn");

  const randomSectionMap = document.getElementById('section-map');
  const randomSectionMood = document.getElementById('mood-section');
  const randomSectionCustom1 = document.getElementById('section-custom-1');
  const randomSectionCustom2 = document.getElementById('section-custom-2');

  btnNext.addEventListener("click", (event) => {
    event.preventDefault();
    // console.log('click');
    // console.log(randomSectionMood.classList);
    randomSectionMood.classList.remove('display-none');
    // randomSectionMood.classList.add('display-block');

    // console.log(randomSectionMood.classList);
    // mapDisplayed.classList.add('d-none');
    // scrollAction.classList.remove('d-none');
  })
}
export { initRandomScroll };
