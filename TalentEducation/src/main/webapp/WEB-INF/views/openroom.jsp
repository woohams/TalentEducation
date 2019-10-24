<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<script type="text/javascript">
		
			$(function() {
				$("#aa").submit();
			});
		
		</script>
	</head>
	<body>
		<img alt="" src="resources/images/loading.gif" style="position: absolute; top: 30%; left: 40%; width: 300px;"/>
		<form action="https://192.168.110.242:3000/${url }" id="aa" method="post">
			<input type="hidden" name="userId" value="${myId }">
			<input type="hidden" name="seq" value="${roomNo }">
		</form>
	</body>
</html>