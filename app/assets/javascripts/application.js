// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require autocomplete-rails
//= require jquery_ujs
//= require jquery-ui
//= require magnific-popup

//= require multi-select

//= require turbolinks
//= require tether
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .

// $( function() {
// $( "#project_start_date" ).datepicker();
// } );

//= require filter_users.js


//= require Chart.bundle
//= require chartkick
//= require magnific-popup

var AddRoles = {
	init: function() {
		$('.popup-with-form').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#name',

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#name';
				}
			}
		}
	});
	}
}
	
$(document).on("turbolinks:load ready", function() {
    AddRoles.init()
})