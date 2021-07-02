const initMoodSelector = () => {
  // const moodCards = document.querySelectorAll('.mood-card');
  // const moodSentence = document.querySelector('.mood-sentence p');
  // moodCards.forEach((card) => {
  //   card.addEventListener("click", (event) => {
  //     moodCards.forEach((card) => {
  //       card.classList.toggle("active-mood-card");
  //       // console.log(moodSentence.innerText === "J'y vais totalement au hasard");
  //       console.log(moodSentence.innerText)
  //       // if (moodSentence.innerText.strip === "J'y vais totalement au hasard") {
  //       //   moodSentence.innerText = "Je choisis quand même un peu";
  //       // }
  //       // if (moodSentence.innerText.strip === "Je choisis quand même un peu") {
  //       //   moodSentence.innerText = "J'y vais totalement au hasard";
  //       // }
  //     })
  //   })
  // })

  const divRandom = document.querySelector(".completely-random");
  const divCustom = document.querySelector(".choose-a-little");
  const divSentence = document.getElementById("mood-sentence");
  const rdmBtn = document.querySelector('#rdm-btn');
  const nextBtn = document.querySelector("#next-btn");
  const randomSectionCustom1 = document.getElementById('section-custom-1');
  const randomSectionCustom2 = document.getElementById('section-custom-2');

  // if (divSentence) {
  //   const imageShy = document.querySelector(".img-shy");
  //   const imageAdv = document.querySelector(".img-adventure");
  //   if (imageAdv.classList.contains('active-mood-card')) {
  //     rdmBtn.classList.remove('display-none');
  //     nextBtn.classList.add('display-none');
  //   }
  // }

  if(divSentence){
    const imageShy = document.querySelector(".img-shy");
    const imageAdv = document.querySelector(".img-adventure");
    imageAdv.addEventListener("click", (event) => {
      divRandom.style.display = "block";
      divCustom.style.display = "none";
      imageAdv.classList.add('active-mood-card');
      imageShy.classList.remove('active-mood-card');

      rdmBtn.classList.remove('display-none');
      nextBtn.classList.add('display-none');

      randomSectionCustom1.classList.add('display-none');
      randomSectionCustom2.classList.add('display-none');
    });

    imageShy.addEventListener("click", (event) => {
      divRandom.style.display = "none";
      divCustom.style.display = "block";
      imageShy.classList.add('active-mood-card');
      imageAdv.classList.remove('active-mood-card');
      rdmBtn.classList.add('display-none');
      nextBtn.classList.remove('display-none');
    });
  }
}

export { initMoodSelector };
