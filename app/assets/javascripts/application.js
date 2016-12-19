// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-table
//= require_tree .

document.getElementById('submit').addEventListener('click', function(e) {
  e.preventDefault();
})

// function initMap() {
//
// 	var broadway = {
// 		info: '<strong>Chipotle on Broadway</strong><br>\
// 					5224 N Broadway St<br> Chicago, IL 60640<br>\
// 					<a href="https://goo.gl/maps/jKNEDz4SyyH2">Get Directions</a>',
// 		lat: 41.976816,
// 		long: -87.659916
// 	};
//
// 	var belmont = {
// 		info: '<strong>Chipotle on Belmont</strong><br>\
// 					1025 W Belmont Ave<br> Chicago, IL 60657<br>\
// 					<a href="https://goo.gl/maps/PHfsWTvgKa92">Get Directions</a>',
// 		lat: 41.939670,
// 		long: -87.655167
// 	};
//
// 	var sheridan = {
// 		info: '<strong>Chipotle on Sheridan</strong><br>\r\
// 					6600 N Sheridan Rd<br> Chicago, IL 60626<br>\
// 					<a href="https://goo.gl/maps/QGUrqZPsYp92">Get Directions</a>',
// 		lat: 42.002707,
// 		long: -87.661236
// 	};
//
// 	var locations = [
//       [broadway.info, broadway.lat, broadway.long, 0],
//       [belmont.info, belmont.lat, belmont.long, 1],
//       [sheridan.info, sheridan.lat, sheridan.long, 2],
//     ];
//
// 	var map = new google.maps.Map(document.getElementById('map'), {
// 		zoom: 13,
// 		center: new google.maps.LatLng(41.976816, -87.659916),
// 		mapTypeId: google.maps.MapTypeId.ROADMAP
// 	});
//
// 	var infowindow = new google.maps.InfoWindow({});
//
// 	var marker, i;
//
// 	for (i = 0; i < locations.length; i++) {
// 		marker = new google.maps.Marker({
// 			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
// 			map: map
// 		});
//
// 		google.maps.event.addListener(marker, 'click', (function (marker, i) {
// 			return function () {
// 				infowindow.setContent(locations[i][0]);
// 				infowindow.open(map, marker);
// 			}
// 		})(marker, i));
// 	}
// }
