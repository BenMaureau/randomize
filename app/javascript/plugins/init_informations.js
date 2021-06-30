const initInformations = () => {
  const infoBtns = document.querySelectorAll('.icon-info');
  if (infoBtns) {
  // When the user clicks the button, open the modal
  for (let i = 0; i < infoBtns.length; i++) {
    infoBtns[i].onclick = function(e) {
      e.preventDefault();
      const btnId = e.target.getAttribute("id");
      console.log(btnId);
      const informations = document.querySelector(`${btnId}`);
      console.log(informations);
      informations.classList.toggle('display-none')
    }
  }
}
}
export { initInformations }
