<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<input type="text" name="id" onchange="" >
					</td>
				</tr>
				<tr>
					<th>PW</th>
					<td>
						<input type="password" name="pw" onchange="">
					</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>
						<input type="text" name="email">
						<button type="button" onclick="">인증</button>
					</td>
				</tr>
				<tr>
					<th>NICKNAME</th>
					<td>
						<input type="text" name="nickname">
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