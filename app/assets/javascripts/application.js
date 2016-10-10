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
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree

console.log("in top400");

jQuery( document ).ready(function() {
	console.log("loaded");
    jQuery( ".draggable" ).draggable({
    	opacity: 0.35,
    	zIndex: 1000,
    	start: function() {
            // $(this).effect("highlight", {}, 1000);
            jQuery(this).css( "cursor","move" );
            jQuery('.box').css('z-index', '100');
            jQuery(this).css('z-index', '500');
        },
        stop: function() {
            jQuery(this).css("cursor","default");
            jQuery(this).css('z-index', '500');
        }
    });
});
