import mapboxgl from "mapbox-gl";
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const mapMarkers = [];
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const newMarker = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
      mapMarkers.push(newMarker)
      // We use the "getElement" funtion provided by mapbox-gl to access to the marker's HTML an set an id
      newMarker.getElement().dataset.markerId = marker.id;
      // Put a microphone on the new marker listening for a mouseenter event
      newMarker.getElement().addEventListener('mouseenter', (e) => toggleCardHighlighting(e) );
      // We put a microphone on listening for a mouseleave event
      newMarker.getElement().addEventListener('mouseleave', (e) => toggleCardHighlighting(e) );
    });

    fitMapToMarkers(map, markers);
    openInfoWindow(mapMarkers);
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const openInfoWindow = (markers) => {
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, index) => {
    card.addEventListener('mouseenter', () => {
      markers[index].togglePopup();
    });
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
}

const toggleCardHighlighting = (event) => {
  // We select the card corresponding to the marker's id
  const card = document.querySelector(`[data-flat-id="${event.currentTarget.dataset.markerId}"]`);
  // Then we toggle the class "highlight github" to the card
  card.classList.toggle('highlight');
}

export { initMapbox };







// let map;
// let mapMarkers = [];

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

// const clearMapMarkers = () => {
//   mapMarkers.forEach((marker) => {
//     marker.remove();
//   });
//   mapMarkers = [];
// };


// const buildMarkers = (map, markersJSON) => {
//   clearMapMarkers();
//   markersJSON.forEach((marker) => {
//     // const element = document.createElement('div');
//     // element.className = 'marker';
//     // element.style.backgroundImage = `url('${marker.image_url}')`;
//     // element.style.backgroundSize = 'contain';
//     // element.style.width = '25px';
//     // element.style.height = '25px';
//     const mapMarker = new mapboxgl.Marker(/*element*/);
//     mapMarker.setLngLat([marker.lng, marker.lat]);
//     mapMarker.addTo(map);
//     mapMarkers.push(mapMarker);
//   });
// };

// const initMapbox = () => {
//   const mapElement = document.getElementById("map");

//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     map = new mapboxgl.Map({
//       container: "map",
//       style: "mapbox://styles/amzcole/ckn3sdi3513q817kggtcu13sd"
//     });

//     const markers = JSON.parse(mapElement.dataset.markers);
//     buildMarkers(map, markers);
//     fitMapToMarkers(map, markers);
//   }
// };

// export { initMapbox };

