$(document).on({
  "ready": renderDirections,
  "page:load": renderDirections
});

function renderDirections() {
  if($(".days.show").length) {
    var waypoints = [];
    var start;
    var end;
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var mapOptions = {
      zoom:7
    }
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    directionsDisplay.setMap(map);

    var locations = $(".address").map(function(index, address) {
      return address.value
    })
    if ( locations.length ) {
      start = locations[0];
    } else {
      start = end = $('#location').text();
    }
    if ( locations.length > 2 ) {
      for ( var i = 1; i < locations.length - 1; i++) {
        waypoints.push({
          location: locations[i],
          stopover:true
        })
      }
      end = locations[locations.length - 1];
    }

    var request = {
      origin:start,
      destination:end,
      waypoints: waypoints,
      travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(result, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(result);
      }
    });
  }
}

function renderMap() {
  if($(".days.show").length) {
    var map;
    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById("start-location").innerHTML;
    console.log(address);
    geocoder.geocode( { 'address': address}, function(results, status) {
      console.log(results, status)
      if (status == google.maps.GeocoderStatus.OK) {
        var latlng = new google.maps.LatLng(results[0].geometry.location.k, results[0].geometry.location.D);
        var mapOptions = {
          zoom: 11,
          center: latlng
        }
        map = new google.maps.Map(document.getElementById('map'), mapOptions);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
}
