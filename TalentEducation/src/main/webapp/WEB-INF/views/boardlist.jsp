<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/boardlist.css">
		<script type="text/javascript" src="resources/js/boardlist.js"></script>
	</head>
	<body>
	<img id="loading" src="resources/images/loading.gif">
	<%@ include file="/resources/template/header.jsp" %>
	<%@ include file="/resources/template/category_head.jsp" %>
	<div id="boardlist_form">
		<%@ include file="/resources/template/category_nav.jsp" %>
		<section>
			<div id="select_board">
				<h4>수업형태</h4>
				<select name="수업형태">
					<option value="온라인">온라인</option>
					<option value="오프라인">오프라인</option>
				</select>
			</div>
			
			<div id="boards">
				<c:choose>
					<c:when test="${empty lectureList}">
						<h2 style="margin: 200px 0px; text-align: center;">-강의가 존재하지 않습니다-</h2>
					</c:when>
					<c:otherwise>
						<c:forEach var="lecture" items="${lectureList }">
						
							<div class="board">
								<input type="hidden" name="boardseq" value="${lecture.board_lecture_seq }">
								<div class="board_img" style="background-image: url('${lecture.board_lecture_image}')">
									
									<div class="tag_box vod">VOD</div>
									<div class="tag_box onoff">온라인</div>
								</div>
								<div class="board_content">
									<p class="board_title">${lecture.board_lecture_title }</p>
									<div>
										<p>★★★☆☆</p>
										<a href="./mypagehome.do?tutor=${lecture.tutor_id }">${lecture.tutor_nik }</a>
									</div>
								</div>
							</div>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>