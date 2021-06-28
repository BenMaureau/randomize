import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    let coords =  [3.066667, 50.633333 ];
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: coords, // center on Lille
      zoom: 12
    });
    // map.dragPan.disable();
    // map.dragRotate.disable();


    
    let marker = createPerimeterMarker();

    setPerimeterMarker(map, marker, coords);
    const current = document.querySelector('#geolocate');
    current.addEventListener('click', (event) => {
      console.log(event);
      navigator.geolocation.getCurrentPosition((data) => {
        coords = [ data.coords.longitude, data.coords.latitude ];
        // console.log(lat);
        map.flyTo({
          center: coords,
          zoom: 12,
          bearing: 0,
          speed: 1, 
          curve: 1,
          essential: true
        });

        setPerimeterMarker(map, marker, coords);
      });
    });
    // Search geocoder
    let geocoder = new MapboxGeocoder({ 
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      placeholder: 'Entre une adresse',
      zoom: 12,
      marker: false
    });

    geocoder.on('result', e => {
      setPerimeterMarker(map, marker, e.result.center);

      map.flyTo({
        center: e.result.center,
        zoom: 12,
        bearing: 0,
        speed: 1, 
        curve: 1,
        essential: true
      });
    });

    map.addControl(geocoder);
    map.addControl(new mapboxgl.NavigationControl());

    map.on('result', e => {console.log('toto')} );
  }
};

const createPerimeterMarker = () => {
  const element = document.createElement('div');
  element.id = 'markerPerimeter';
  element.style.backgroundColor = "#FFBF00";
  element.style.border = "solid 2px #FF7145";
  element.style.width = '50px';
  element.style.height = '50px';
  element.style.opacity = "50%";
  element.style.borderRadius = "50%";
  return element;
};

const setPerimeterMarker = (map, marker, coords) => {
  if(marker) {
    marker.style.display = 'none';
    new mapboxgl.Marker(marker)
      .setLngLat(coords)
      .addTo(map);
    marker.style.display = 'block';
  }
};


export { initMapbox };
