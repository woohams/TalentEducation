<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/te/resources/css/header.css">
<script type="text/javascript" src="/te/resources/js/header.js"></script>

<header>

	<sec:authentication property="principal" var="member" />
	<div class="TE_header">
		<div class="TE_header_left">
			<p><a href="/te/home.do">Talent Education</a></p>
			<img alt="" src="/te/resources/images/logo.png">
		</div>
		
		<div class="TE_header_right">
			<sec:authorize access="isAuthenticated()">
				<form id="logout" action='/te/logout' method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					
				</form>
				<p><a href="/te/lectureinsert.do">강의글 작성</a></p>
				<p><a onclick="$('#logout').submit();">LOGOUT</a></p>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<p><a href="/te/loginform.do">LOGIN</a></p>
			</sec:authorize>
			<img id="TE_header_menu" alt="" src="/te/resources/images/menu.jpg">
		</div>
		
	</div>
	<div class="TE_header_slider">
		<div class="TE_header_slider_menus">
			<div class="TE_header_slider_menu">
				<h3>마이 홈</h3>
				<a href="/te/member/mypagehome.do">홈</a>
				<a href="/te/mypageinfo.do">내 정보</a>
				<a href="/te/calendar.do">스케쥴</a>
				<a href="">VOD</a>
				<a href="">도서구매</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>인기수업</h3>
				<a href="/te/boardlist.do">메이크업</a>
				<a href="">영상편집</a>
				<a href="">포토샵/일러스트</a>
				<a href="">방송댄스</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>디자인</h3>
				<a href="">포토샵</a>
				<a href="">일러스트레이터</a>
				<a href="">UX/UI디자인</a>
				<a href="">건축</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>실무역량</h3>
				<a href="">엑셀</a>
				<a href="">파워포인트</a>
				<a href="">스피치</a>
				<a href="">재무회계</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>뷰티</h3>
				<a href="">메이크업</a>
				<a href="">퍼스널컬러</a>
				<a href="">헤어</a>
				<a href="">패션</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>영상</h3>
				<a href="">프리미어</a>
				<a href="">영상기획/촬영</a>
				<a href="">여행영상</a>
				<a href="">VJ</a>
			</div>
			<div class="TE_header_slider_menu">
				<h3>음악</h3>
				<a href="">보컬</a>
				<a href="">피아노</a>
				<a href="">기타연주</a>
				<a href="">드럼</a>
			</div>
		</div>
	</div>
</header>