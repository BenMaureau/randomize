import Typed from 'typed.js';

const bannerText = document.getElementById('banner-typed-text');

const loadDynamicBannerText = () => {
  if(bannerText) {
    console.log('coucou');
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
