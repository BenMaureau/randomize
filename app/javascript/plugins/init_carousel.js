const initCarousel = () => {
  const mainCarousel = document.querySelector('.my-carousel');
  if (mainCarousel) {

    $(document).ready(function(){
      $('.my-carousel').slick({
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2500,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 1,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 800,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
      });
    });
  }
};

const initCarouselReviews = () => {
  const carouselReviews = document.querySelector('.my-carousel-reviews');
  if (carouselReviews) {

    $(document).ready(function(){
      $('.my-carousel-reviews').slick({
  
        dots: false,
        infinite: true,
        speed: 1000,
        fade: true,
        cssEase: 'linear',
        cssEase: 'ease-out',
        cssEase: 'ease-in-out',
        cssEase: 'ease',
        autoplay: true,
        autoplaySpeed: 2000,
        // slidesToShow: 2,
        // slidesPerRow: 2,
        // slidesToScroll: 1,
        // vertical: true
  
      });
    });
  }

};

export { initCarousel, initCarouselReviews } 