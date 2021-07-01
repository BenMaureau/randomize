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

const tapBannerButton = () => {
  const bannerButton = document.getElementById('banner-button');
  if (bannerButton) {
    window.onscroll = () => {
      if (window.scrollY > window.outerHeight * 0.6) {
        console.log('tap');
        bannerButton.classList.add('my-tap-container');
      } else {
        console.log('pas tap');
        bannerButton.classList.remove('my-tap-container');
      }
    }

  }
}

export { loadDynamicBannerText, tapBannerButton };
