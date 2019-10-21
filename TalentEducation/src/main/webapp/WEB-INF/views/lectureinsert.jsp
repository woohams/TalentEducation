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
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<section>
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="member" />
			<form action="./lectureinsert.do" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="hidden" name="tutor_id" value="${member.id }"/>
				<div id="board_main">
					<div id="board_top">
						<div class="board_top_div">
							<img alt="" src="resources/images/sample.jpg">
						</div>
						<div class="board_top_div">
							<h1><input type="text" name="title" value="" placeholder="제목을 입력하세요"></h1>
						</div>
					</div>
					
					<div id="board_bottom">
						<div id="board_description">
							<textarea name="content" id="summernote"></textarea>
						</div>
						<input type="submit" value="작성 완료">
					</div>
				</div>
			</form>
		</sec:authorize>
	</section>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>