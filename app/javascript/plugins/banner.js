import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerText = document.getElementById('banner-typed-text');
  const activities = bannerText.dataset.activities;
  new Typed('#banner-typed-text', {
    strings: activities.split(","),
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
