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
<%@ include file="/resources/template/head.jsp" %>
<link rel="stylesheet" href="resources/css/regist.css">
<script type="text/javascript" src="resources/js/regist.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
</head>
<%@ include file="/resources/template/header.jsp" %>
<body>
<div id="regist_form">
	<div id = "regist">
		<div id="h5s">
			<h5>ID</h5>
			<h5>PW</h5>
			<h5>Email</h5>
			<h5>NickName</h5>
		</div>
<form action="./registinsert.do" method="post" id="registF" onsubmit="return submitChk();">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				
					
					<div class="form-group">
						<input type="text"  name="id" onchange="idChk();" placeholder="ID" autofocus autocomplete="off" required >
						<span id="id_check"></span>
					</div>
					<div class="form-group">
						<input type="password" name="pw" onchange="pwChk();" placeholder="Password" autofocus autocomplete="off" required >
						<span id="pw_check"></span>
					</div>	
					<div class="form-group">
		                <input type="text"  id="emailId" placeholder="Email을 입력해주세요" autofocus autocomplete="off" required >
		                <span id="email_check"></span><br>
		                <input type="text"  id="emailService" value="gmail.com" disabled="disabled">
               		<select id="selectEmail" onchange="emailSelect();">
	                	<option value="write">직접입력</option>
						<option value="gmail.com" selected="selected">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
               		 </select>
               			<input type="hidden" name="email" > 
               			<a id="emailBtn" onclick="emailChk();">인증</a> <br>
              			
					</div> <br>
					<div class="form-group">
						<input type="text" name="nickname" onchange="nicChk();" placeholder="Nickname" autofocus autocomplete="off" required >
						<span id="nic_check"></span>
					</div>
					<div>
						<input type="submit" id="submit" value="가입" class="myButton">
					</div>
	</form>
	</div>
</div>	
 	<%@ include file="/resources/template/footer.jsp" %>
</body>
</html>