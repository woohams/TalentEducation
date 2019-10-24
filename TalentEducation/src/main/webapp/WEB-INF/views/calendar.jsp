<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/mypage.css">
		
		<link rel="stylesheet"  href="resources/css/fullcalendar.css"  />  
		<link rel="stylesheet" href="resources/css/calendar.css">
		
	</head>
	
	
	<body>
	<%@ include file="/resources/template/header.jsp" %>
		
	<div id="mypage_form">
		<%@ include file="/resources/template/mypage_nav.jsp" %>
		<section style="height:855px; margin-top: 40px;">
			<div id="calendar" style="width:1000px;"></div>			
		</section>
	</div>

	<%@ include file="/resources/template/footer.jsp" %>
	</body>
	
	<script type="text/javascript" src="resources/js/calendar.js"></script>
	<!-- fullcalendar-3.10.0 version used -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<script src="resources/js/fullcalendar.js"></script>
	<script type="text/javascript" src="resources/js/ko.js"></script>
</html>




