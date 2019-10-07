<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/boardlist.css">
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<%@ include file="/resources/template/category_head.jsp" %>
	<div id="boardlist_form">
		<%@ include file="/resources/template/category_nav.jsp" %>
		<section>
			<div id="select_board">
			</div>
			<div id="boards">
				<div class="board">
					<div class="board_img">
						<div class="tag_box1">VOD</div>
						<div class="tag_box2">오프라인</div>
					</div>
					<div class="board_content">
						<p class="board_title">대충맛</p>
						<div>
							<p>★★★☆☆</p>
							<a href="">글쓴이</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>