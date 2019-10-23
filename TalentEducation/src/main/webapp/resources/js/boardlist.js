$(function() {
	$(".board").bind("click", function(e) {
		var no = ($(this).find("input[name=boardseq]").val());
		location.href="./selectone.do?boardseq=" + no;
	});
});