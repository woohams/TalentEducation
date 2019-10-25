function imgUpload() {
	var imgOpen = window.open("", "img_target", "width= 10px; height= 10px; top= 10000px; left= 10000px;");
	document.getElementById("img_upload").submit();
	
}
$(document).ready(function() {
     
     $("#mainImg").click(function() {
    	$("#img_upload").css("display", "block");
     });
});