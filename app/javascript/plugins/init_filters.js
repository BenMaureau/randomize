const initFilters = () => {

  function value(field) {
    if (field.value == "false" || field.value == '') {
      field.value = true; }
    else if (field.value == "true") {
        field.value = false; }
  }

  const aventurier = document.querySelector(".img-adventure");
  const aventurier_field = document.querySelector("#aventurier-field");
  const prudent = document.querySelector(".img-shy");
  const prudent_field = document.querySelector("#prudent-field");
  if (aventurier && prudent) {
    aventurier.addEventListener ('click', (event) => {
      aventurier_field.value = true;
      prudent_field.value = false;
    })

    prudent.addEventListener ('click', (event) => {
      aventurier_field.value = false;
      prudent_field.value = true;
    })
  }

  const max_price = document.querySelector("#max-price");
  const price_field = document.querySelector("#price-field");
  if (max_price && price_field) {
    max_price.addEventListener ('keyup', (event) => {
      console.log(max_price.value);
      price_field.value = max_price.value;
      console.log(price_field.value);
    })
  }

  const indoor = document.getElementById("indoor-card");
  const indoor_field = document.getElementById("indoor-field");
  if (indoor) {
    indoor.addEventListener ('click', (event) => {
      value(indoor_field);
    })
  }

  const outdoor = document.getElementById("outdoor-card");
  const outdoor_field = document.getElementById("outdoor-field");
  if (outdoor) {
    outdoor.addEventListener ('click', (event) => {
      value(outdoor_field);
    })
  }

  const sport = document.getElementById("sport-card");
  const sport_field = document.getElementById("sport-field");
  if (sport) {
    sport.addEventListener ('click', (event) => {
      value(sport_field);
    })
  }

  const social = document.getElementById("social-card");
  const social_field = document.getElementById("social-field");
  if (social) {
    social.addEventListener ('click', (event) => {
      value(social_field);
    })
  }

  const culture = document.getElementById("culture-card");
  const culture_field = document.getElementById("culture-field");
  if (culture) {
    culture.addEventListener ('click', (event) => {
      value(culture_field);
    })
  }

  const nature = document.getElementById("nature-card");
  const nature_field = document.getElementById("nature-field");
  if (nature) {
    nature.addEventListener ('click', (event) => {
      value(nature_field);
    })
  }

  const bien_etre = document.getElementById("bien_etre-card");
  const bien_etre_field = document.getElementById("bien_etre-field");
  if (bien_etre) {
    bien_etre.addEventListener ('click', (event) => {
      value(bien_etre_field);
    })
  }

  const sensation = document.getElementById("sensation-card");
  const sensation_field = document.getElementById("sensation-field");
  if (sensation) {
    sensation.addEventListener ('click', (event) => {
      value(sensation_field);
    })
  }
}

export { initFilters }
