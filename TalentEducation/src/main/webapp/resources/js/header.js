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
	
	var didScroll = false;
	var lastScroll = 0;
	var scroll = 0;
	$(window).scroll(function(event) {
		didScroll = true;
		scroll = $(window).scrollTop();
	});
	
	setInterval(function() {
		if(didScroll) {
			if(scroll > lastScroll && scroll > 70) {
				$("header").css("opacity", 0);
				$("header").css("top", -70);
			}else {
				$("header").css("opacity", 1);
				$("header").css("top", 0);
			}
			didScroll = false;
		}
	}, 250);
	
	
	$(window).ajaxStart(function() { 
		$("#loading").css("display", "block");
		$("#loading").css("opacity", "1");
	}).ajaxStop(function() {
		$("#loading").css("opacity", "0");
		$("#loading").one("transitionend", function() {
			$("#loading").css("display", "none");
		});
	});
	
});