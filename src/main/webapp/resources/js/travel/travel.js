var map;
var mapWide;
function initMap() {
	var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var labelIndex = 0;
	var kh = {lat:-33.865143, lng: 151.209900};
	var sydney = new google.maps.LatLng(-33.867, 151.195);
	map = new google.maps.Map(document.getElementById('map'), {zoom:15, center:sydney});
	mapWide = new google.maps.Map(document.getElementById('mapWide'), {zoom:15, center:sydney});
	var infowindow = new google.maps.InfoWindow();
	var input = document.getElementById('searchInput');
	var searchBox = new google.maps.places.SearchBox(input);
	var markers = [
		{
			location:sydney, 
			icon:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
			info:'<h1>sydney</h1>'
		}
		];

	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();

		if(places.length === 0) {
			return;
		}

		//clear out the old markers
		markers.forEach(function(m) {
			//m.setMap(null);
		});
		markers = [];

		//for each place, get the icon, name, and location
		var bounds = new google.maps.LatLngBounds();

		places.forEach(function (p) {
			if(!p.geometry) {
				return;
			}
			//create marker for each place
			markers.push(new google.maps.Marker({
				map:map,
				title: p.name,
				position: p.geometry.location
			}));

			if(p.geometry.viewport) {
				//only geocodes have viewport
				bounds.union(p.geometry.viewport);
			}else {
				bounds.extend(p.geometry.location);
			}
		});
		map.fitBounds(bounds);
	});


	/* addMarker({
	      		location:sydney, 
	      		icon:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
	      		info:'<h1>sydney</h1>'
	      	}); */

	for(var i = 0; i < markers.length; i++) {
		addMarker(markers[i]);
	}

	var request = {
			query: 'Museum of Contemporary Art Australia',
			fields: ['name', 'geometry'],
	};

	var service = new google.maps.places.PlacesService(map);

	service.findPlaceFromQuery(request, function(results, status) {
		if (status === google.maps.places.PlacesServiceStatus.OK) {
			for (var i = 0; i < results.length; i++) {
				addMarker({location:results[i].geometry.location});
			}
			map.setCenter(results[0].geometry.location);
		}
	});



	function addMarker(props) {
		var marker = new google.maps.Marker({
			position: props.location,
			label: labels[labelIndex++ % labels.length],
			map: map
		});
		if(props.icon) {
			marker.setIcon(props.icon);
		}
		if(props.info) {
			var infoWindow = new google.maps.InfoWindow({
				content:props.info
			});
			marker.addListener('click', function() {
				infoWindow.open(map, marker);
			});
		}
	}

	google.maps.event.addListener(map, 'click', function(event) {
		addMarker({location:event.latLng});
	});
}