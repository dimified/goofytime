// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(document).ready(function () {
  setTimeout(function() {
    $('.showFlash').fadeOut(); 
    }, 2500); 
     
  $(".datepicker").datepicker({
    dateFormat : "yy-mm-dd",
    buttonImageOnly : false,
    buttonImage : "<%= asset_path('iconDatePicker.gif') %>",
    showOn : "both",
    changeMonth : true,
    changeYear : true,
    yearRange : "c-20:c+5"
  })


});




(function($) {
	
	$.fn.clearField = function(settings) {
		
		/**
		 * Settings
		 * 
		 */
		
		settings = jQuery.extend({
			blurClass: 'clearFieldBlurred',
			activeClass: 'clearFieldActive',
			attribute: 'rel',
			value: ''
		}, settings);
		
		
		/**
		 * loop each element
		 * 
		 */
		
		return $(this).each(function() {
			
			/**
			 * Set element
			 * 
			 */
			
			var el = $(this);
			
			
			/**
			 * Get starting value
			 * 
			 */
			
			settings.value = el.val();
			
			
			/**
			 * Add or get attribute
			 * 
			 */
			
			if(el.attr(settings.attribute) == undefined) {
				el.attr(settings.attribute, el.val()).addClass(settings.blurClass);
			} else {
				settings.value = el.attr(settings.attribute);
			}
			
			
			/**
			 * Set focus action
			 * 
			 */
			
			el.focus(function() {
				
				if(el.val() == el.attr(settings.attribute)) {
					el.val('').removeClass(settings.blurClass).addClass(settings.activeClass);
				}
				
			});
			
			
			/**
			 * Set blur action
			 * 
			 */
			
			el.blur(function() {
				
				if(el.val() == '') {
					el.val(el.attr(settings.attribute)).removeClass(settings.activeClass).addClass(settings.blurClass);
				}
				
			});
			
			
		});
		
	};
	
})(jQuery);


$(document).ready(function() {
		$('.clearField').clearField();
	});
