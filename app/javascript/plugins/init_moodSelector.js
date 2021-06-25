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
  const btnRandomize = document.querySelector(".button-randomize");
  const btnSuivant = document.querySelector(".button-suivant");

  if(divSentence){
    const imageShy = document.querySelector(".img-shy");
    const imageAdv = document.querySelector(".img-adventure");
    imageAdv.addEventListener("click", (event) => {
      divRandom.style.display = "block";
      divCustom.style.display = "none";
      imageAdv.classList.add('active-mood-card');
      imageShy.classList.remove('active-mood-card');
      // btnRandomize.style.display = "block";
      // btnSuivant.style.display = "none";
    });

    imageShy.addEventListener("click", (event) => {
      divRandom.style.display = "none";
      divCustom.style.display = "block";
      imageShy.classList.add('active-mood-card');
      imageAdv.classList.remove('active-mood-card');
      // btnRandomize.style.display = "none";
      // btnSuivant.style.display = "block";
    });
  }
}

export { initMoodSelector };
