<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<%@ include file="/resources/template/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/full-page-scroll.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
</head>
<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="main" class="scroll-container">
		<section>
		</section>
		<section>
		</section>
		<section>
		</section>
		<section>
		</section>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/full-page-scroll.js"></script>
	<script type="text/javascript">
		new fullScroll({
			displayDots: true,
			dotsPosition: 'left',
			animateTime: 0.7,
			animateFunction: 'ease'
		});
	</script>
</body>
</html>
