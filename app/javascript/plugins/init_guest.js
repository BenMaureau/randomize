import Typed from 'typed.js';

const initGuest = () => {
  const guestName = document.getElementById('guest-text');
  if (guestName) {
    const guests = guestName.dataset.guests;
    const dynamicWords = guests.split(',');
    new Typed('#guest-text', {
      strings: dynamicWords,
      typeSpeed: 50,
      loop: true
    });
  }
}

export { initGuest };
