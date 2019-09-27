$(function() {
	$("#TE_header_menu").click(function() {
		var slider = $(".TE_header_slider");
		var display = slider.css('display');
		
		if(display == 'none') {
			slider.slideDown(400);
		}else if(display == 'block') {
			slider.slideUp(200);			
		}
	});
});