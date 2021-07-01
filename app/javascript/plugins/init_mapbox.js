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

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      // Create a HTML element for your custom marker
      const element = document.createElement('a');
      element.className = 'marker';
      element.style.cursor = 'pointer';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });

    if (markers) {
      const mapMarkers = document.querySelectorAll('.mapboxgl-marker');
      const displayMarkers = (markers) => {
        const array = []
        markers.forEach((marker) => {
          array.push(marker);
          marker.style.display = 'none';
        });

        const someMarkers = array.slice(0, 5).map(function () {
          return this.splice(Math.floor(Math.random() * this.length), 1)[0];
        }, array.slice());

        someMarkers.forEach((marker) => {
          marker.style.display = 'block';
        });
      }
      setInterval(function(){ displayMarkers(mapMarkers); }, 3000);
      displayMarkers(mapMarkers);
    };

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
  element.classList.add('box-shadow');
  element.style.backgroundColor = "#003566";
  element.style.border = "solid 4px white";
  element.style.width = '24px';
  element.style.height = '24px';
  element.style.opacity = "80%";
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
