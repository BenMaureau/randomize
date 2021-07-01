const initNavbar = () => {
  const avatar = document.querySelector('.avatar')
  if (avatar) {
    avatar.addEventListener('click', (event) => {
      const dropMenuProfile = document.querySelector('#my-menu-profile')
      const dropMenuNotifications = document.querySelector('#my-menu-notifications')
      dropMenuProfile.classList.toggle("display-none");
      dropMenuNotifications.classList.add("display-none");
    })
  }
  const notif = document.querySelector('.bell')
  if (notif) {
    notif.addEventListener('click', (event) => {
      const dropMenuProfile = document.querySelector('#my-menu-profile')
      const dropMenuNotifications = document.querySelector('#my-menu-notifications')
      dropMenuNotifications.classList.toggle("display-none");
      dropMenuProfile.classList.add("display-none");
      // dropMenu2.addEventListener("click", (event) => {
      //   const clickedEvent = document.getElementById('clicked-event')
      //   clickedEvent.classList.add("display-none");
      // })
    })
  }
}

// app/javascript/components/navbar.js
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    let lastScrollTop = 0;
    window.addEventListener('scroll', () => {
      let st = window.pageYOffset || document.documentElement.scrollTop;
      if (st > lastScrollTop) {
        navbar.classList.add('navbar-disabled');
      } else {
        navbar.classList.remove('navbar-disabled');
      }
      lastScrollTop = st <= 0 ? 0 : st;
    }, false);
  }
}



// element should be replaced with the actual target element on which you have applied scroll, use window in case of no target element.
// element.addEventListener("scroll", function(){ // or window.addEventListener("scroll"....
//    let st = window.pageYOffset || document.documentElement.scrollTop; // Credits: "https://github.com/qeremy/so/blob/master/so.dom.js#L426"
//    if (st > lastScrollTop){
//       // downscroll code
//    } else {
//       // upscroll code
//    }
//    lastScrollTop = st <= 0 ? 0 : st; // For Mobile or negative scrolling
// }, false);


export { initNavbar, initUpdateNavbarOnScroll };
