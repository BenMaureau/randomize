import Typed from 'typed.js';

const bannerText = document.getElementById('banner-typed-text');

const loadDynamicBannerText = () => {
  if (bannerText) {
    const activities = bannerText.dataset.activities;
    const dynamicWords = activities.split(',');
    console.log(dynamicWords);
    new Typed('#banner-typed-text', {
      strings: dynamicWords,
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
