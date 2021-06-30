const initFilters = () => {

  function value(field) {
    if (field.value == "false" || field.value == '') {
      field.value = true; }
    else if (field.value == "true") {
        field.value = false; }
  }

  const one_person = document.querySelector("#one-person");
  const one_person_field = document.querySelector("#one-person-field");
  const two_people = document.querySelector("#two-people");
  const two_people_field = document.querySelector("#two-people-field");
  if (one_person && two_people) {
    one_person.addEventListener ('click', (event) => {
      console.log(one_person);
      one_person_field.value = true;
      two_people_field.value = false;
      one_person.classList.add('active-mood-card', 'check')
      two_people.classList.remove('active-mood-card', "check")
    })

    two_people.addEventListener ('click', (event) => {
      console.log(one_person);
      one_person_field.value = false;
      two_people_field.value = true;
      one_person.classList.remove('active-mood-card', 'check');
      two_people.classList.add('active-mood-card', 'check');
    })
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
      price_field.value = max_price.value;
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

  const manger = document.getElementById("manger-card");
  const manger_field = document.getElementById("manger-field");
  if (manger) {
    manger.addEventListener ('click', (event) => {
      value(manger_field);
    })
  }

  const sortir = document.getElementById("sortir-card");
  const sortir_field = document.getElementById("sortir-field");
  if (sortir) {
    sortir.addEventListener ('click', (event) => {
      value(sortir_field);
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

  const divertir = document.getElementById("divertir-card");
  const divertir_field = document.getElementById("divertir-field");
  if (divertir) {
    divertir.addEventListener ('click', (event) => {
      value(divertir_field);
    })
  }
}

export { initFilters }
