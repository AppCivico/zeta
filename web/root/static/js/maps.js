var $maps = function(){
    var map;
    var addr;
    var geocoder;
    var markersArray = [];
    var polyline;

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

        if(!$('#elm_origin').length && !$('#vehicle_tracker_vehicle').length) {
            google.maps.event.addListener(map, 'click', function(event) {
                clearOverlays();
                addMarker(event.latLng);
                reverseCode(event.latLng);

                $("#elm_lat_lng").val(event.latLng.toString());
            });
        }
    }

    function codeAddress(selector, addr_value) {
        var address = $(addr_value).val();

        if (address.length != 0 && addr != address) {
            geocoder.geocode( { 'address': address}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    clearOverlays();

                    if (results[0]){
                        map.setCenter(results[0].geometry.location);
                        map.setOptions({zoom: 14});

                        $(selector).val(results[0].geometry.location.toString());

                        var marker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location
                        });
                        markersArray.push(marker);
                    }else{
                        $(selector).val('');
                    }

                } else {
                    $(selector).val('');
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
                    /*todo: tornar generico */
                    console.log(results[1]);
                    $('#elm_parking_address').val(results[1].formatted_address);
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

    function calcRoute(positions) {
        if (positions.length > 0) {
            var keep    = {};
            var points  = [];

            for( var i = 0; i < positions.length; i++ ) {
                keep["z" + i] = new google.maps.DirectionsService();

                if(positions[i].origin && positions[i].destination) {
                    var request = {
                        origin: positions[i].origin,
                        destination: positions[i].destination,
                        travelMode: google.maps.TravelMode.DRIVING
                    };

                    keep["z" + i].route(request, function(result, status) {
                        keep["x"+i] = new google.maps.DirectionsRenderer({
                            suppressMarkers: true,
                            suppressInfoWindows: true
                        });

                        if (status == google.maps.DirectionsStatus.OK) {
                            points.push(result.routes[0].overview_path[0]);
                            save_positions(points);
                            keep["x"+i].setDirections(result);
                            keep["x"+i].setMap(map);
                        }
                    });
                }
            }

        }
    }

    function save_positions(positions) {
        console.log(positions);
    }

    return {
        initialize: initialize,
        codeAddress: codeAddress,
        calcRoute: calcRoute,
        reverseCode: reverseCode,
        getPoints: getPoints
    };

    function printPolyline(positions) {
        if (!positions) {
            clearPolyline();
            clearOverlays();
            return false;
        }

        clearOverlays();

        var path = [];
        path.length = 0;
        var latLngBounds = new google.maps.LatLngBounds();

        for( var i = 0; i < positions.vehicle_trackers.length; i++ ) {
            path.push(new google.maps.LatLng(positions.vehicle_trackers[i].lat, positions.vehicle_trackers[i].lng));
            latLngBounds.extend(path[i]);

            var $date;
            var $hour;
            if(positions.vehicle_trackers[i].track_event.length) {
                $date = positions.vehicle_trackers[i].track_event.split(' ');
                $hour = $date[1].substr(0,5);
                $date = $date[0].substr(8,2)+'/'+$date[0].substr(5,2)+'/'+$date[0].substr(0,4);
            }

            var marker = new google.maps.Marker({
                map: map,
                position: path[i],
//                 icon: '/static/img/invisible.png',
                icon: '/static/img/1381172153_Map-Marker-Marker-Outside-Azure.png',
                info: 'Data: '+$date
                      +'<br /> Hora: '+$hour
                      +'<br />Velocidade :'+positions.vehicle_trackers[i].speed+' Km/h'
            });

            markersArray.push(marker);

            var infowindow = new google.maps.InfoWindow(), marker;
            google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
                return function() {
                    infowindow.setContent(this.info);
                    infowindow.open(map, marker);
                }
            })(marker));

        }

        clearPolyline();

        polyline = new google.maps.Polyline( {
            map: map,
            path: path,
            strokeColor: '#0000FF',
            strokeOpacity: 0.7,
            strokeWeight: 10,
        } );

        map.fitBounds(latLngBounds);
    }

    function clearPolyline() {
        if (polyline) {
            polyline.setMap(null);
        }
    }

    function getPoints(form_data) {
        $.ajax({
            url: "/user/vehicle_tracker/get_positions",
            data:form_data,
            dataType: 'json',
            success: function(result) {
                   console.log(result)
                if(result.vehicle_trackers.length > 0) {
                    $('#empty_tracker').hide();
                    printPolyline(result);
                } else {
                    printPolyline(false);
                    $('#empty_tracker').show();
                }
            },
            error: function(err) {
                console.log(err);
            },
            complete: function(){
                $('#search_track').button('reset');
            }
        });

    }
}();

$( document ).ready(function() {
    $maps.initialize();

    if($('#elm_address').length > 0 && $('#elm_address').val().length > 0) {
        $maps.codeAddress('#elm_lat_lng', '#elm_address');
    }

    if($('#elm_parking_address').length) {

        if($('#elm_parking_address').val().length > 0) {
            $maps.codeAddress('#elm_lat_lng', '#elm_parking_address');
        }

        $('#elm_parking_address').on('blur', function() {
            $maps.codeAddress('#elm_lat_lng', $(this));
        });

    }

    $('#elm_address').blur(function(){
        $maps.codeAddress('#elm_lat_lng', '#elm_address');
    });

    if(
        $('#elm_origin').length &&  $('#elm_origin').val().length &&
        $('#elm_destination').length && $('#elm_destination').val().length
    )
    {
        $maps.codeAddress('#elm_origin_lat_lng', '#elm_origin');
        $maps.codeAddress('#elm_destination_lat_lng', '#elm_destination');
        $maps.calcRoute();
    }

    $('#elm_origin, #elm_destination').blur(function(){
       if($('#elm_origin').val().length > 0 && $('#elm_destination').val().length > 0) {
            $maps.codeAddress('#elm_origin_lat_lng', '#elm_origin');
            $maps.codeAddress('#elm_destination_lat_lng', '#elm_destination');
            $maps.calcRoute();
        }
    });

    if($('#form_tracker').length) {
        var $date = new Date();

        $date = $date.getDate()+'/'+($date.getMonth()+1)+'/'+$date.getFullYear();
        $('#elm_date').val($date);


        $maps.getPoints($('#form_tracker').serialize());

;       $('#form_tracker').on('submit', function() {
            event.preventDefault();
            $maps.getPoints($(this).serialize());
       });
    }

});
