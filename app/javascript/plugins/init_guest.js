import Typed from 'typed.js';

const guestName = document.getElementById('guest-text');

const initGuest = () => {
  if (guestName) {
    const guests = guestName.dataset.guests;
    console.log(guests);
    const dynamicWords = guests.split(',');
    console.log(dynamicWords);
    new Typed('#guest-text', {
      strings: dynamicWords,
      typeSpeed: 50,
      loop: true
    });
  }
}

export { initGuest };
