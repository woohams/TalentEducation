function updelSubmit(val) {
	var action = '';
	
	switch(val) {
	case '수정' : action = './lectureupdate.do'; break;
	case '삭제' : action = './lecturedelete.do'; break;
	}
	$("#updel_form").attr('action', action);
	$("#updel_form").submit();
}


$(function() {
	var didScroll = false;
	var scroll = 0;
	$(window).scroll(function(event) {
		didScroll = true;
		scroll = $(window).scrollTop();
	});
	
	setInterval(function() {
		if(scroll) {
			if(scroll > 50) {
				$("#board_pay").css("top", (scroll-50)+"px");
			}else {
				$("#board_pay").css("top", "0px");
			}
			scroll = false;
		}
	}, 150);
	
});