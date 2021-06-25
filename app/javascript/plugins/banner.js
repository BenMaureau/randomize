import Typed from 'typed.js';

const bannerText = document.getElementById('banner-typed-text');

const loadDynamicBannerText = () => {
  if(bannerText) {
    const activities = bannerText.dataset.activities;
    new Typed('#banner-typed-text', {
      strings: activities.split(","),
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
