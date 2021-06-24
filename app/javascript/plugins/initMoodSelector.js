const initMoodSelector = () => {
  const divRandom = document.querySelector(".completely-random");
  const divCustom = document.querySelector(".choose-a-little");
  const divSentence = document.getElementById("mood-sentence");
  console.log(divCustom);
  if(divSentence){
    const imageAdv = document.querySelector(".img-adventure");
    imageAdv.addEventListener("click", (event) => {
      console.log(divRandom)
      divRandom.style.display = "block";
      divCustom.style.display = "none";
      imageAdv.style.border = "3px solid #ffc300";
      imageAdv.style.borderRadius = '3px';
      imageShy.style.border = "none";
    });

    const imageShy = document.querySelector(".img-shy");
    imageShy.addEventListener("click", (event) => {
      divRandom.style.display = "none";
      divCustom.style.display = "block";
      imageShy.style.border = "3px solid #ffc300";
      imageShy.style.borderRadius = '3px';
      imageAdv.style.border = "none";
    });
  }
}

export { initMoodSelector };
