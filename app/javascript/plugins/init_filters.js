const initFilters = () => {

  const max_price = document.querySelector("#max-price");
  const active_indoor_outdoor_card = document.querySelectorAll(".active-indoor-outdoor-card");

  const next_btn = document.querySelector("#next-btn");
  if (next_btn) {
    next_btn.addEventListener ('click', (event) => {
      console.log(max_price.value);
      console.log(active_indoor_outdoor_card);
    })
  }
}

export { initFilters }
