# Constants
mapOptions = {
  zoom: 5,
  center: {lat: 38.6, lng: -95.7},
  mapTypeId: 'terrain'
  mapTypeControl: false
  streetViewControl: false
  fullscreenControl: false
}
lineSymbol = {
  path: 'M 0,-.2 0,.2'
  strokeOpacity: 1
  scale: 5
};
redirectToPlace = (slug) ->
  window.location.href = "/photos/#{slug}"
setMapPlaceHeader = (text) ->
  $("#map-place-header").html(text)
clearMapPlaceHeader = () ->
  $("#map-place-header").empty()
enlargeMarkerIcon = (marker) ->
  marker.setIcon({
    url: "/assets/map_marker.png"
    scaledSize: new google.maps.Size(64, 64)
  })
shrinkMarkerIcon = (marker) ->
  marker.setIcon({
    url: "/assets/map_marker.png"
    scaledSize: new google.maps.Size(48, 48)
  })

# Document Ready
$(
  ->
    # Setup
    mapContainer = document.getElementById("map-container")
    return if !mapContainer
    map = new google.maps.Map(mapContainer, mapOptions)
    directionsService = new google.maps.DirectionsService
    markers = []
    # Draw Route Method
    drawRoute = (options) ->
      directionsDisplay = new google.maps.DirectionsRenderer({
        map: map
        preserveViewport: true
        suppressMarkers: true
        polylineOptions: {
          clickable: false
          strokeColor: options.color || "#9b3012"
          strokeOpacity: 0
          icons: [{
            icon: lineSymbol
            offset: '0'
            repeat: '15px'
          }]
        }
      })
      request = {
        origin: options.origin
        destination: options.destination
        waypoints: options.waypoints || []
        travelMode: google.maps.DirectionsTravelMode.DRIVING
      }
      directionsService.route(request, (response) -> directionsDisplay.setDirections(response) )
    # Place Marker Method
    placeMarker = (geoPoint) ->
      marker = new google.maps.Marker({
        position: { lat: geoPoint.lat, lng: geoPoint.lng }
        map: map
        icon: {
          url: "/assets/map_marker.png"
          scaledSize: new google.maps.Size(48, 48)
        }
      });
      google.maps.event.addListener(marker, 'click',     () -> redirectToPlace(geoPoint.slug))
      google.maps.event.addListener(marker, 'mouseover', () -> setMapPlaceHeader(geoPoint.name); enlargeMarkerIcon(marker))
      google.maps.event.addListener(marker, 'mouseout',  () -> clearMapPlaceHeader();            shrinkMarkerIcon(marker))
      markers.push(marker)
    # Draw routes, place markers
    helga.routes.forEach(drawRoute)
    helga.geoPoints.forEach(placeMarker)
)
