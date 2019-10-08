<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>임시 회원가입</h1>

<form action="./insert.do" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<table border="1">
			<tbody>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id" onchange="" placeholder="ID" required autofocus>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				    <font color="red">
				        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
				        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
				    </font>
				    	</c:if>
					</td>
				</tr>
				<tr>
					<th>PW</th>
					<td>
						<input type="password" name="pw" onchange="" placeholder="Password" required autofocus>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				    <font color="red">
				        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
				        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
				    </font>
				    	</c:if>
					</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>
						<input type="text" name="email"placeholder="Email" required autofocus>
						<input type="button" onclick="" >인증</input>
					</td>
				</tr>
				<tr>
					<th>NICKNAME</th>
					<td>
						<input type="text" name="nickname" placeholder="Nickname" required autofocus>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원가입!">
						<input type="button" onclick="location.href='./'" value="홈으로">
					</td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>