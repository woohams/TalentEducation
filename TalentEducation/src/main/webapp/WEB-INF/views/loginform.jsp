<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script language="javascript" type="text/javascript">
    setTimeout(function() {
    opener.location.reload(); //부모창 리프레쉬
    self.close(); //현재창 닫기
    }, 20000); // 2초후 실행 1000당 1초
</script>
<head>
<meta charset="UTF-8">
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
					<a href="./findpwpage.do">PW찾기</a>	
					<input type="submit" value="로그인">
					<input type="button" onclick="location.href='./regist.do'" value="회원가입">
					<input type="button" onclick="location.href='./'" value="홈으로">
				</div>
	</form>
	

</body>
</html>