<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>login</title>

</head>
<body>

	<form action='./login' method="post">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<div class="login-form">
					<input type="text" name="id" placeholder="ID" required autofocus>
				</div>
				<div class="login-form">
					<input type="password" name="pw"  placeholder="Password" required>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				    <font color="red">
				        <p>Your login attempt was not successful due to <br/>
				            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
				        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
				    </font>
						</c:if>
				</div>
				<div class="login-form">
					<a href="./findidpage.do">ID찾기</a>
					<a href="./findpwpage.do">PW찾기</a><br>
					<input type="submit" value="로그인">
					<input type="button" onclick="location.href='./regist.do'" value="회원가입">
					<input type="button" onclick="location.href='./'" value="홈으로">
				</div>
				<div id="kakao-login-btn"></div>
				<div id="naver_id_login"></div>
			</form>
				<form id="snsLogin" action='./login' method="post">
			      <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			      <input type="hidden" id="snsId" name="id" />
			      <input type="hidden" id="snsPw" name="pw" />	
				</form>
	
	<script src=" https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> </script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script src="resources/js/loginform.js"></script>						
</body>
</html>