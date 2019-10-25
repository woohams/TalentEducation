<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		
		<link rel="stylesheet" href="resources/css/lectureinsert.css">
		<script type="text/javascript" src="resources/js/lectureinsert.js"></script>
		
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="summernote/dist/summernote.css" rel="stylesheet">
<link rel="stylesheet" href="static/base.css" />

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="summernote/dist/summernote.js"></script>
<script src="summernote/dist/lang/summernote-ko-KR.js"></script>
		
	</head>
	<script type="text/javascript">
		$(function() {
		
	 	 $('#summernote').summernote({
		  height: 300,                 
         minHeight: null,           
         maxHeight: null,            
         focus: true,               
         lang : 'ko-KR',
         toolbar: [
       	    ['style', ['bold', 'italic', 'underline', 'clear']],
       	    ['font', ['strikethrough', 'superscript', 'subscript']],
       	    ['fontsize', ['fontsize']],
       	    ['color', ['color']],
       	    ['para', ['ul', 'ol', 'paragraph']],
       	    ['height', ['height']],
       	    ['insert', ['link', 'picture']],
       	  ],
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
        	 
       	   console.log(files);
	        	  console.log(editor);
	        	  console.log(welEditable);
          	for (var i = files.length - 1; i >= 0; i--) {
             sendFile(files[i], this);
           }
         }
       }
	  });
	});

	function sendFile(file, editor) {
		
		data = new FormData();
	    data.append("uploadFile", file);
	    console.log(file+data+editor)
	    $.ajax({
	        data : data,
	        type : "POST",
	        url : "/te/summerImgUpload.do",
	        cache : false, 
	        contentType : false,
	        enctype: 'multipart/form-data',
	        processData : false,
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       		 },
	        success : function(data) {
	        	console.log(data)
	        	$(editor).summernote('editor.insertImage', data.url);
	        	console.log(data.url)
	        }
	    });
	}
	</script>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<section>
		<sec:authorize access="isAuthenticated()">
			<form action="./lectureinsert.do" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="tutor_id" value="${member.id }"/>
				<input type="hidden" name="tutor_nik" value="${member.nickname }"/>
				<input id="hiddenImg" type="hidden" name="board_lecture_image" value=""/>
				<div id="board_main">
					<div id="board_top">
						<div class="board_top_div">
							<img id="board_mainimg" alt="" src="resources/images/sample.jpg">
						</div>
						<div class="board_top_div">
							<h1><input type="text" name="board_lecture_title" value="" placeholder="제목을 입력하세요"></h1>
						</div>
					</div>
					<div id="board_bottom">
						<div id="board_description">
							<textarea name="board_lecture_content" id="summernote"></textarea>
						</div>
						<input type="submit" value="작성 완료">
					</div>
				</div>
			</form>
		</sec:authorize>
			
		<form id="img_upload" action="./uploadimage.do" method="post" enctype="multipart/form-data" target="img_target">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="memberseq" value="${member.member_seq }">
			<input type="file" name="file" accept="image/*" onchange="imgUpload();">
		</form>
	</section>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>