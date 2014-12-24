// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


$(document).on('change', '#city', function(event) {
	var selected_city_id = $("#city").val();
	
	$.get("/ajax/get_hotels", {city_id: selected_city_id});
});


$(document).on('change', '#hotel', function(event) {
	var selected_hotel_id = $("#hotel").val();
	
	$.get("/ajax/get_rooms", {hotel_id: selected_hotel_id});
});

$(document).on('change', '#room', function(event) {
	var selected_room_id = $("#room").val();

	$.get("/ajax/submit", {room_id: selected_room_id});
});

$(document).on('click', '#book', function(event) {
	var name = $("#name").val();
	var date_start_1i = $("#date_start_1i").val();
	var date_start_2i = $("#date_start_2i").val();
	var date_start_3i = $("#date_start_3i").val();
	var date_end_1i = $("#date_end_1i").val();
	var date_end_2i = $("#date_end_2i").val();
	var date_end_3i = $("#date_end_3i").val();
	var selected_room_id = $("#room").val();

	if (name == "") {
		alert("Type your name!");
		return;
	}

	params = 'user_name=' + name + '&room_id=' + selected_room_id + '&date_start=' + date_start_1i + '-' +
	date_start_2i + '-' + date_start_3i + '&date_end=' + date_end_1i + '-' + date_end_2i + '-' + date_end_3i;

	$.ajax({
      type: 'POST',
      url: '/ajax/book',
      data: params,
      success: function(data) {
        sendSuccess(data);
      },
      error: function() {
        alert('Server error');
      }
    }); 
});

function sendSuccess(data) {
	if (!data) {
		alert('You have booked room!');
	} else {
		alert('Room already booked!');
	}
	
}

