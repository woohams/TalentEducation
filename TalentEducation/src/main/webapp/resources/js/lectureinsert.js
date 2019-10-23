function imgUpload() {
	var imgOpen = window.open("", "img_target", "width= 10px; height= 10px; top= 10000px; left= 10000px;");
	document.getElementById("img_upload").submit();
	
}
$(document).ready(function() {
     $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
     $('#summernote').summernote();
     
     $("#board_mainimg").click(function() {
    	$("#img_upload").css("display", "block");
     });
});