<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/boardselectone.css">
		<script type="text/javascript" src="resources/js/boardselectone.js"></script>
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	
	<section>
		<div id="board_main">
			<div id="board_top">
				<div class="board_top_div">
					<img alt="" src="${lecture.board_lecture_image }">
				</div>
				<div class="board_top_div">
					<h1>${lecture.board_lecture_title }</h1>
					<input type="button" value="ON AIR">
				</div>
				<div class="board_top_div">
					<div id="board_top_share">
						<img alt="" src="resources/images/sample.jpg">
						<img alt="" src="resources/images/sample.jpg">
					</div>
					<div id="board_top_writer">
						<img alt="" src="resources/images/sample.jpg">
						<p>${lecture.tutor_nik }</p>
					</div>
				</div>
			</div>
			
			<div id="board_bottom">
				<div id="board_bottom_menu">
					<a href="">강사 소개</a>
					<a href="">커리큘럼</a>
					<a href="">리뷰</a>
				</div>
				<div id="board_description">
					${lecture.board_lecture_content }
				</div>
				<c:choose>
					<c:when test="${member != 'anonymousUser'}">
						<c:if test="${lecture.tutor_id == member.id }">
							<sec:authorize access="isAuthenticated()">
								<form id="updel_form" action="" method="post">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
									<input type="hidden" name="boardseq" value="${lecture.board_lecture_seq }">
									<input type="button" value="수정" onclick="updelSubmit(this.value);">
									<input type="button" value="삭제" onclick="updelSubmit(this.value);">
								</form>
							</sec:authorize>
						</c:if>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="board_pay">
			<input type="button" value="결제하기">
		</div>
	</section>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>