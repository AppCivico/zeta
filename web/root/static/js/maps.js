$( document ).ready(function() {
    initialize();

    if($("#elm_address").val().length > 0) {
        codeAddress();
    }

    $("#elm_address").blur(function(){
        codeAddress();
    });
});

var geocoder;
var map;
var markersArray = [];
var addr;

function initialize() {
  geocoder      = new google.maps.Geocoder();
  var latlng    = new google.maps.LatLng(-23.5505233,-46.63429819999999); //praça da sé

  var mapOptions = {
    zoom: 8,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

  google.maps.event.addListener(map, 'click', function(event) {
    clearOverlays();
    addMarker(event.latLng);
    reverseCode(event.latLng);

    $("#elm_lat_lng").val(event.latLng.mb+','+event.latLng.nb);
  });
}

function codeAddress() {
    var address = $("#elm_address").val();

    if(address.length != 0 && addr != address) {
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                clearOverlays();

                map.setCenter(results[0].geometry.location);
                map.setOptions({zoom: 14});

                $("#elm_lat_lng").val(results[0].geometry.location.mb+','+results[0].geometry.location.nb);

                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                markersArray.push(marker);
            } else {
                $("#elm_lat_lng").val(0);
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

    addr = address;
}

function reverseCode(latlng) {
  geocoder.geocode({'latLng': latlng}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
            $("#elm_address").val(results[1].formatted_address);
            console.log(results);
      } else {
        alert('Endereço não encontrado.');
      }
    } else {
      alert('Falha na busca por endereços.');
    }
  });
}

function addMarker(location) {
  marker = new google.maps.Marker({
    position: location,
    map: map
  });
    markersArray.push(marker);
}

function clearOverlays() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    deleteOverlays();
  }
}

function deleteOverlays() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
}