(function($) {
	
	
	var disableElements = function() {

		// Enable all
		$('.payengine3cw-control-box').each(function () {
			$(this).find('input').prop('disabled', false);
			$(this).find('select').prop('disabled', false);
			$(this).find('textarea').prop('disabled', false);
		});
		
		// Disable selected
		$('.payengine3cw-use-default .payengine3cw-control-box').each(function () {
			$(this).find('input').prop('disabled', true);
			$(this).find('select').prop('disabled', true);
			$(this).find('textarea').prop('disabled', true);
		});
	};

	$(document).ready(function() {
		$(".payengine3cw-default-box input").click(function() {
			$(this).parents(".control-box-wrapper").toggleClass('payengine3cw-use-default');
			disableElements();
		});
		disableElements();
	});

})(jQuery);
