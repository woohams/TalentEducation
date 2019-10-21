<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/mypage.css">
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="mypage_form">
		<%@ include file="/resources/template/mypage_nav.jsp" %>
		<section>
			<h1>내정보</h1>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="member" />
		<form action="./member/myinfoupdateres.do" method="post">	
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="member_seq" value="${member.member_seq }">
					<div class="form-group">
						<input type="text"  name="id" value="${member.id }"  readonly="readonly" >
					</div>
					<div class="form-group">
						<input type="password" name="pw" onchange="pwChk();" >
						<span id="pw_check"></span>
					</div>	
					<div class="form-group">
               			<input type="text" name="email" value="${member.email }"  readonly="readonly"> 
               		</div>
					<div class="form-group">	
						<input type="text" name="nickname" onchange="nicChk();" value="${member.nickname }" >
						<span id="nic_check"></span>
					</div>
					<div>
						<input type="submit"  value="수정" >
					</div>
		</form>
		</sec:authorize>
		</section>
	</div>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>