const initIndoorSelector = () => {
  const indoorSelector = document.querySelector('#indoor-card');
  const outdoorSelector = document.querySelector('#outdoor-card');

  if (indoorSelector && outdoorSelector) {
    indoorSelector.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle('active-indoor-outdoor-card');
    })
    outdoorSelector.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle('active-indoor-outdoor-card');
    })
  }
}

export { initIndoorSelector }
