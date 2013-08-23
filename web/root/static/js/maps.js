var map;
var addr;
var geocoder;
var markersArray = [];
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

$( document ).ready(function() {
    initialize();

    if($('#elm_address').length > 0 && $("#elm_address").val().length > 0) {
        codeAddress('#elm_lat_lng', '#elm_address');
    }

    $('#elm_address').blur(function(){
        codeAddress('#elm_lat_lng', '#elm_address');
    });

    if(
        $('#elm_origin').length &&  $('#elm_origin').val().length &&
        $('#elm_destination').length && $('#elm_destination').val().length
    )
    {
        calcRoute();
        codeAddress('#elm_origin_lat_lng', '#elm_origin');
        codeAddress('#elm_destination_lat_lng', '#elm_destination');
    }

    $('#elm_origin, #elm_destination').blur(function(){
       if($('#elm_origin').val().length > 0 && $('#elm_destination').val().length > 0) {
            calcRoute();
            codeAddress('#elm_origin_lat_lng', '#elm_origin');
            codeAddress('#elm_destination_lat_lng', '#elm_destination');
        }
    });

});

function initialize() {
    var latlng        = new google.maps.LatLng(-23.5505233,-46.63429819999999); //praça da sé
    geocoder          = new google.maps.Geocoder();
    directionsDisplay = new google.maps.DirectionsRenderer();

    var mapOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

    if(!$('#elm_origin').length) {
        google.maps.event.addListener(map, 'click', function(event) {
            clearOverlays();
            addMarker(event.latLng);
            reverseCode(event.latLng);

            $("#elm_lat_lng").val(event.latLng.mb+','+event.latLng.nb);
        });
    }
}

function codeAddress(selector, addr_value) {
    var address = $(addr_value).val();

    if(address.length != 0 && addr != address) {
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                clearOverlays();

                map.setCenter(results[0].geometry.location);
                map.setOptions({zoom: 14});

                $(selector).val(results[0].geometry.location.mb+','+results[0].geometry.location.nb);
                console.log(results[0].geometry.location.mb+','+results[0].geometry.location.nb);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                markersArray.push(marker);
            } else {
                $(selector).val(0);
                alert('Falha ao localizar endereço');
            }
        });
    }

    addr = address;
}

function reverseCode(latlng) {
    geocoder.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                $('#elm_address').val(results[1].formatted_address);
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

function calcRoute() {
    var start = $('#elm_origin').val();
    var end   = $('#elm_destination').val();

    var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode.DRIVING
    };

    directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
            directionsDisplay.setMap(map);
        }
    });
}