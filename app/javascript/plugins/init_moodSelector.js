const initMoodSelector = () => {
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
      btnRandomize.style.display = "block";
      btnSuivant.style.display = "none";
    });

    imageShy.addEventListener("click", (event) => {
      divRandom.style.display = "none";
      divCustom.style.display = "block";
      imageShy.classList.add('active-mood-card');
      imageAdv.classList.remove('active-mood-card');
      btnRandomize.style.display = "none";
      btnSuivant.style.display = "block";
    });
  }
}

export { initMoodSelector };
