<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script type="text/javascript" src="resources/js/clock.js"></script>
<nav>
	<div class="TE_mypage_nav">
		<img alt="" src="resources/images/sample.jpg"/>
		<h3>닉네임</h3>
		<a href="">id</a>
		<div class="TE_mypage_nav_btn">
			<input type="button" value="강의"/>
			<input type="button" value="과외"/>
		</div>
	</div>
	<div class="TE_mypage_nav">
		<h3>내정보</h3>
		<a href="">내 정보</a>
		<a href="calendar.do">스케쥴</a>
	</div>
	<div class="TE_mypage_nav">
		<h3>VOD</h3>
		<a href="">전체 VOD</a>
		<a href="">다시보기</a>
		<a href="">업로드 VOD</a>
	</div>
	<div class="TE_mypage_nav">
		<h3>게시판</h3>
		<a href="">공지 게시판</a>
		<a href="">일반 게시판</a>
	</div>
	<div id="clock" style="padding: 10px;"></div>
</nav>