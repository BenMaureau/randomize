// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initMoodSelector } from '../plugins/init_moodSelector';
import { searchMap } from '../plugins/search_map';
import { initRandomScroll } from '../plugins/init_random_scroll';
import { initCategoryCheckbox } from '../plugins/init_category_checkbox';
import { initLoader } from '../plugins/init_loader';
import { initReviewModal} from '../plugins/init_reviewModal';
import { loadDynamicBannerText } from '../plugins/banner';
import { initIndoorSelector } from '../plugins/init_indoorSelector';
import { initFilters } from '../plugins/init_filters';
import { initSweetalert } from '../plugins/init_sweetalert';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initMoodSelector();
  searchMap();
  initRandomScroll();
  initCategoryCheckbox();
  initLoader();
  initReviewModal();
  initIndoorSelector();
  loadDynamicBannerText();
  initFilters();
  initSweetalert('#btn-reveal-activity', {
    title: "Tu es sûr?",
    text: "Il est encore temps d'être un vrai aventurier",
    icon: "warning",
    closeOnClickOutside: false,
    closeOnEsc: false,
    dangerMode: true,
    buttons: ["Je suis joueur", "Je veux voir"]
  }, (value) => {
    if (value) {
      const card = document.querySelector('.my-activity-card');
      card.classList.remove("activity-secret");
      const btnResa = document.getElementById('btn-booking-reservation');
      btnResa.href = btnResa.href.replace('false', 'true');
    }
  });
})




