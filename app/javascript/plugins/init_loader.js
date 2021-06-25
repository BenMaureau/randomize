const initLoader = () => {
  const loader = document.getElementById('loader')
  if (loader) {
    setTimeout(function(){
      loader.style.display = 'none';
      document.getElementById('activity-revealed').style.display = 'block';
    }, 3000); // 10000ms = 10s
  }
}

export { initLoader };
