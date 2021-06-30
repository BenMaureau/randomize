const initCarousel = () => {
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
};

const initCarouselReviews = () => {
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


    // $('.my-carousel-reviews').slick({
    //   centerMode: true,
    //   // centerPadding: '60px',
    //   slidesToShow: 3,
    //   vertical: true,
    //   autoplay: true,
    //   autoplaySpeed: 2000,
    //   infinite: true,
    //   speed: 800,
    //   slidesToShow: 3,

    //   responsive: [
    //     {
    //       breakpoint: 768,
    //       settings: {
    //         arrows: false,
    //         centerMode: true,
    //         // centerPadding: '40px',
    //         slidesToShow: 2
    //       }
    //     },
    //     {
    //       breakpoint: 480,
    //       settings: {
    //         arrows: false,
    //         centerMode: true,
    //         // centerPadding: '40px',
    //         slidesToShow: 1
    //       }
    //     }
    //   ]
    // });



  });

};

export { initCarousel, initCarouselReviews } 