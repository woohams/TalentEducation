<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/lectureinsert.css">
		<script type="text/javascript" src="resources/js/lectureinsert.js"></script>
		
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include summernote css/js-->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
		
		<script type="text/javascript">
		
			function updelSubmit(val) {
				var action = '';
				
				switch(val) {
				case '수정' : action = './lectureupdateres.do'; break;
				case '삭제' : action = './lecturedelete.do'; break;
				}
				$("#updel_form").attr('action', action);
				$("#updel_form").submit();
			}
		
			
		</script>
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<section>
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="member" />
			<form id="updel_form" action="" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="board_lecture_seq" value="${lecture.board_lecture_seq }"/>
				<input type="hidden" name="tutor_id" value="${member.id }"/>
				<input type="hidden" name="tutor_nik" value="${member.nickname }"/>
				<input id="hiddenImg" type="hidden" name="board_lecture_image" value="${lecture.board_lecture_image }"/>
				<div id="board_main">
					<div id="board_top">
						<div class="board_top_div">
							<img id="board_mainimg" alt="" src="${lecture.board_lecture_image }">
						</div>
						<div class="board_top_div">
							<h1><input type="text" name="board_lecture_title" value="${lecture.board_lecture_title }" placeholder="제목을 입력하세요"></h1>
						</div>
					</div>
					
					<div id="board_bottom">
						<div id="board_description">
							<textarea name="board_lecture_content" id="summernote">${lecture.board_lecture_content }</textarea>
						</div>
						<input type="button" value="수정" onclick="updelSubmit(this.value)">
						<input type="button" value="삭제" onclick="updelSubmit(this.value)">
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