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
//= require ckeditor-jquery
//= require bootstrap
//= require turbolinks
//= require_tree .

//custom js for home page functionality.
(function ($) {
    $.fn.showHide2 = function (options) {

	//default vars for the plugin
        var defaults = {
            speed: 1000,
			easing: '',
			changeText: 1,
			showText: 'Show',
			hideText: 'Hide'
        };

        var options = $.extend(defaults, options);

        $(this).click(function () {	
           
             $('.toggleDiv').slideUp(options.speed, options.easing);	
			 // this var stores which button you've clicked
             var toggleClick = $(this);

		     // this reads the rel attribute of the button to determine which div id to toggle
		     var toggleDiv = $(this).attr('rel');

		     // here we toggle show/hide the correct div at the right speed and using which easing effect
		     $(toggleDiv).slideToggle(options.speed, options.easing, function() {

		     // this only fires once the animation is completed
		     $(toggleDiv).is(":visible") ? $("#overview_header[rel="+toggleDiv+"] img.arrow").attr('src', '/assets/arrow-up.png') : $("#overview_header[rel="+toggleDiv+"] img.arrow").attr('src', '/assets/arrow-down.png');

        });
		   
		  return false; 	   
        });
    };
})(jQuery);

$(function(){
   $('.show_hide2').showHide2({			 
		speed: 500,  // speed you want the toggle to happen	
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'Login / Register',// the button text to show when a div is closed
		hideText: 'Login / Register' // the button text to show when a div is open				 
	}); 
});