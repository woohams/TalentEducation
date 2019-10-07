$(function() {
	$("header").hover(function() {
		$("header").css('background-color', 'white');
		$(".TE_header a").css('color', 'rgb(50,50,50)');
	},function() {
		$("header").css('background-color', 'rgb(50,50,50)');
		$(".TE_header a").css('color', 'white');
	});
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