import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerText = document.getElementById('banner-typed-text');
  if (bannerText) {
    const activities = bannerText.dataset.activities;
    const dynamicWords = activities.split(',');
    new Typed('#banner-typed-text', {
      strings: dynamicWords,
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
