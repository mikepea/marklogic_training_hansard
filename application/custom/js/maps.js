function initialize() {
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map"),
        myOptions);

    loadPoints(map);
}

$(document).ready(function() {
    initialize();
});

function buildMarkerClickEventHandler(marker, href) {
    google.maps.event.addListener(marker, 'click', function() {
        window.location = href;
    });
};

function loadPoints(map) {
    $.ajax({
        url: "/custom/get-points.xqy",
        contentType: "xml",
        success: function(data) {
            var bounds = new google.maps.LatLngBounds();
            $(data).find("location").each(function(index) {
                var lat = $(this).find("lat").text();
                var long = $(this).find("long").text();
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat, long),
                    map: map,
                    title: $(this).find("name").text()
                });
                buildMarkerClickEventHandler(marker, $(this).find("url").text());
                bounds.extend(new google.maps.LatLng(lat, long));
            });
            map.fitBounds(bounds);
        }
    });
};

