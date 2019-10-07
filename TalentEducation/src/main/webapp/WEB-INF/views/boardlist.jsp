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
				<div class="board">
				
					<div class="board_img">
						
						<div class="tag_box vod">VOD</div>
					</div>
					<div class="board_content">
						<p class="board_title">대충맛</p>
						<div>
							<p>★★★☆☆</p>
							<a href="">글쓴이</a>
						</div>
					</div>
				</div>
				<div class="board">
				
					<div class="board_img">
						
						<div class="tag_box onoff">오프라인</div>
					</div>
					<div class="board_content">
						<p class="board_title">대충맛</p>
						<div>
							<p>★★★☆☆</p>
							<a href="">글쓴이</a>
						</div>
					</div>
				</div>
				<div class="board">
				
					<div class="board_img">
						
						<div class="tag_box vod">VOD</div>
						<div class="tag_box onoff">오프라인</div>
					</div>
					<div class="board_content">
						<p class="board_title">대충맛dddddddddddddddddd ddddsdㅇㅇㅇdddddddd</p>
						<div>
							<p>★★★☆☆</p>
							<a href="">글쓴이</a>
						</div>
					</div>
				</div>
			
				<div class="board">
				
					<div class="board_img">
						
						<div class="tag_box vod">VOD</div>
						<div class="tag_box onoff">오프라인</div>
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