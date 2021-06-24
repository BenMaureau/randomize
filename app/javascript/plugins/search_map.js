const searchMap = () =>{
  const search = document.querySelector(".mapboxgl-ctrl-geocoder--input");
  const search2 = document.querySelector(".hiddenAddress");
  if (search) {
    search.addEventListener("change", (event) => {
      search2.value = event.currentTarget.value;
    })
  }
}

export {searchMap}
