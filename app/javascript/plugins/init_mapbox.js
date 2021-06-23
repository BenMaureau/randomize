import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

      // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      // element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';
      element.style.backgroundColor = "#ffc300";
      element.style.opacity = "20%";
      element.style.borderRadius = "50px";
      element.style.border = "1px solid #003566"

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
    map.setZoom(8);
    const rangeInput = document.getElementById("formControlRange");

    rangeInput.addEventListener("change", function() {
      map.setZoom(parseInt(rangeInput.value,10)/6);
    }, false);
  }
};

export { initMapbox };
