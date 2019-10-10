$(function() {
	$(".board").bind("click", function(e) {
		var no = ($(this).find("input[name=boardNo]").val());
		location.href="./selectone.do?boardno=" + no;
	});
});