$( document ).ready(function() {

    initialize();

    if($("#elm_address").val().length > 0) {
        codeAddress();
    }

    $("#elm_address").blur(function(){
        codeAddress();
    });

    $(".errors").hide();

    $('.postal_code').blur(function(){
        var postal_code = $(this).val();
        var invalid     = false;

        $(".errors").hide();

        if(postal_code == '') {
            invalid = true;
            $("#postal_code_error").show();
        }

        if(invalid == false) {
            $.ajax({
                url: "/get_address",
                data: {postal_code: postal_code},
                dataType: 'json',
                success: function(result){
                    $("#elm_address").val(result.address);
                    $("#elm_neighborhood").val(result.neighborhood);
                    $('#elm_state_id').val(result.state_id);

                    if($('#elm_city_id').find(":contains("+result.location+")").length) {
                        $('#elm_city_id').val(result.city_id);
                    } else {
                        $('#elm_city_id').append('<option value='+result.city_id+'>'+result.location+'</option>').val(result.city_id);
                    }
                }
            });
        }
    });

});

function reset_button(){
    setTimeout(function () {
        $("#check_token").button('reset');
    })
}

//code for geolocalization using google maps API V3

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