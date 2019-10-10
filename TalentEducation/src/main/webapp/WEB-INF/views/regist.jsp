<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="resources/js/regist.js"></script>
</head>
<body>
<h1>임시 회원가입</h1>

<form action="./insert.do" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="form-group">
						<label></label>
						<input type="text"  name="id" onchange="idChk();" placeholder="ID"><br>
						<span id="id_check"></span>
					</div>
					<div class="form-group">
						<input type="password" name="pw" onchange="pwChk();" placeholder="Password"><br>
						<span id="pw_check"></span>
					</div>	
					<div class="form-group">
						<input type="text" name="email"placeholder="Email" >
						<input type="button" onclick="" >인증</input>
					</div>
					<div class="form-group">	
						<input type="text" name="nickname" placeholder="Nickname">
					</div>
					<div>
						<input type="submit" value="회원가입!">
						<input type="button" onclick="location.href='./'" value="홈으로">
					</div>
	</form>

</body>
</html>