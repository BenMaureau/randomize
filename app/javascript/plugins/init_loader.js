const initLoader = () => {
  const loader = document.getElementById('loader');
  if (loader) {
    setTimeout(function(){
      loader.classList.add('display-none');
      document.getElementById('activity-revealed').style.display = 'block';
    }, 5000); // 10000ms = 10s
    document.body.addEventListener("mousemove", function () {
      const audio = new Audio('reveal.mp3');
      audio.play();
    })
  }
}

export { initLoader };
