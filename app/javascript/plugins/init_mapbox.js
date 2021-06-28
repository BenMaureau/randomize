import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  // const fitMapToMarkers = (map, markers) => {
  //   const bounds = new mapboxgl.LngLatBounds();
  //   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  //   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  // };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    let lon = 3.066667;
    let lat = 50.633333;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [lon ,lat], // center on Lille
      zoom: 12
    });

    
    let marker = createPerimeterMarker();

    setPerimeterMarker(map, marker, lon, lat);
    const current = document.querySelector('#geolocate');
    current.addEventListener('click', (event) => {
      console.log(event);
      navigator.geolocation.getCurrentPosition((data) => {
        const lat = data.coords.latitude;
        const lon = data.coords.longitude;
        console.log(lat);
        const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [lon,lat],
          zoom: 12
        });

        setPerimeterMarker(map, marker, lon, lat);
      });
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
    // map.setZoom(8);
    // const rangeInput = document.getElementById("formControlRange");

    // rangeInput.addEventListener("change", function() {
    //   map.setZoom(parseInt(rangeInput.value,10)/6);
    // }, false);
  }
};

const createPerimeterMarker = () => {
  const element = document.createElement('div');
  element.id = 'markerPerimeter';
  element.style.backgroundColor = "#FFBF00";
  element.style.border = "solid 2px #FF7145";
  // element.style.backgroundSize = 'contain';
  element.style.width = '50px';
  element.style.height = '50px';
  // element.style.backgroundColor = "#ffc300";
  element.style.opacity = "50%";
  element.style.borderRadius = "50%";
  return element;
};

const setPerimeterMarker = (map, marker, lon, lat) => {
  if(marker) {
    marker.style.display = 'none';
    new mapboxgl.Marker(marker)
      .setLngLat([lon, lat])
      .addTo(map);
    marker.style.display = 'block';
  }
  // element.style.border = "1px solid #003566"
};


export { initMapbox };
