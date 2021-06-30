const initInformations = () => {
  const infoBtns = document.querySelectorAll('.icon-info');
  if (infoBtns) {
  // When the user clicks the button, open the modal
  for (let i = 0; i < infoBtns.length; i++) {
    infoBtns[i].onclick = function(e) {
      e.preventDefault();
      const informations = document.querySelector(e.target.getAttribute("id"));
      console.log(informations);
      informations.classList.toggle('display-none')
   }
  }
}
}
export { initInformations }
