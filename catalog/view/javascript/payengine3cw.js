(function ($) {
	
	var attachEventHandlers = function() {
		if (typeof payengine3cw_ajax_submit_callback != 'undefined') {
			$('.payengine3cw-confirmation-buttons input').each(function () {
				$(this).click(function() {
					PayEngine3CwHandleAjaxSubmit();
				});
			});
		}
	};
	
	var getFieldsDataArray = function () {
		var fields = {};
		
		var data = $('#payengine3cw-confirmation-ajax-authorization-form').serializeArray();
		$(data).each(function(index, value) {
			fields[value.name] = value.value;
		});
		
		return fields;
	};
	
	var PayEngine3CwHandleAjaxSubmit = function() {
		
		if (typeof cwValidateFields != 'undefined') {
			cwValidateFields(PayEngine3CwHandleAjaxSubmitValidationSuccess, function(errors, valid){alert(errors[Object.keys(errors)[0]]);});
			return false;
		}
		PayEngine3CwHandleAjaxSubmitValidationSuccess(new Array());
		
	};
	
	var PayEngine3CwHandleAjaxSubmitValidationSuccess = function(valid) {
		
		if (typeof payengine3cw_ajax_submit_callback != 'undefined') {
			payengine3cw_ajax_submit_callback(getFieldsDataArray());

		}
		else {
			alert("No JavaScript callback function defined.");
		}
	}
		
	$( document ).ready(function() {
		attachEventHandlers();
		
		$('#payengine3cw_alias').change(function() {
			$('#payengine3cw-checkout-form-pane').css({
				opacity: 0.5,
			});
			$.ajax({
				type: 		'POST',
				url: 		'index.php?route=checkout/confirm',
				data: 		'payengine3cw_alias=' + $('#payengine3cw_alias').val(),
				success: 	function( response ) {
					var htmlCode = '';
					try {
						var jsonObject = jQuery.parseJSON(response);
						htmlCode = jsonObject.output;
					}
					catch (err){
						htmlCode = response;
					}
					
					var newPane = $("#payengine3cw-checkout-form-pane", $(htmlCode));
					if (newPane.length > 0) {
						var newContent = newPane.html();
						$('#payengine3cw-checkout-form-pane').html(newContent);
						attachEventHandlers();
					}
					
					$('#payengine3cw-checkout-form-pane').animate({
						opacity : 1,
						duration: 100, 
					});
				},
			});
		});
		
	});
	
}(jQuery));