const initIndoorSelector = () => {
  const indoorOutdoorSelectors = document.querySelectorAll('.select-indoor-outdoor');
  if (indoorOutdoorSelectors){
    indoorOutdoorSelectors.forEach((selector) => {
      selector.addEventListener("click", (event) => {
        console.log(event.currentTarget);
        event.currentTarget.classList.toggle('active-indoor-outdoor-card');
      })
    })
  }
}

export { initIndoorSelector }