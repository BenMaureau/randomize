const initDisplayScroll = () => {
  const btnScroll = document.getElementById("next-scroll");
  const mapDisplayed = document.getElementById("map-diplayed");
  const scrollAction = document.getElementById("scrolling-action");
  btnScroll.addEventListener("click", (event) => {
    mapDisplayed.classList.add('d-none');
    scrollAction.classList.remove('d-none');
  })
}
export {initDisplayScroll};
