<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="/te/resources/css/mypage.css">
		<script type="text/javascript" >
		var pwConfirm = 0;
		var nickConfirm = 0;
		var pattern_Pw = /^(?=.*[a-zA-Z!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
		var pattern_nic = /^[ㄱ-ㅎ가-힣A-Za-z0-9!@#$%^*+=-]{1,14}$/;
		
		function pwChk(){
			var pw = $("input[name=pw]").val();
			
			
			if(!pattern_Pw.test(pw)){
				$("#pw_check").css("color", "red");
				$("#pw_check").html(" 6~15 문자,숫자 혼합");
				$("input[name=pw]").focus();
				pwConfirm = 0;
				return false;
			}else{
				$("#pw_check").css("color", "blue");
				$("#pw_check").html("사용가능한 password 입니다.");
				$("input[name=nickname]").focus();
				pwConfirm = 1;
				return false;			
			}
			
		}

		function nicChk(){
			var nic = $("input[name=nickname]").val();
			
			if(!pattern_nic.test(nic)){
				$("#nic_check").css("color", "red");
				$("#nic_check").html("1~14글자, 공백은 사용불가능");
				$("input[name=nickname]").focus();
				nickConfirm = 0;
				return false;
			}else{
				$("#nic_check").css("color", "blue");
				$("#nic_check").html("사용가능한 닉네임 입니다.");
				nickConfirm = 1;
				return false;
			}
			
		} 
		function submitChk(){
	
			if(pwConfirm == 0){
				alert("pw를 형식에 맞게 입력해주세요");
				$("input[name=pw]").focus();
				return false;
			}
			if(nickConfirm == 0){
				alert("닉네임을 형식에 맞게 입력해주세요");
				$("input[name=nickname]").focus();
				return false;
			}
		
			alert("수정 성공!");
			return true;
		}
		function imgUpload() {
			var imgOpen = window.open("", "img_target", "width= 10px; height= 10px; top= 10000px; left= 10000px;");
			document.getElementById("img_upload").submit();
			
		}
		
		
		</script>
		
	</head>
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="mypage_form">
		<%@ include file="/resources/template/mypage_nav.jsp" %>
		<section id="myinfoS">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="member" />
		<form action="/te/myinfoupdateres.do" method="post" id="myinfoF" >	
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="member_seq" value="${member.member_seq }">
			<input id="hiddenImg" type="hidden" name="profile_img" value="${member.profile_img }">
					<c:set var="id" value="${member.id}" />
					<c:choose>
					    <c:when test="${fn:length(id) > 10}">
					       <h2>SNS로그인 사용자는 <br>Nickname & profile_image<br> 변경 가능합니다.</h2><br>
					    </c:when>
					    <c:otherwise>
					    <div class="form-group">
							<label>ID</label>
							<input type="text"  name="id" value="${member.id }"  readonly="readonly" ><br>
						</div>
						<div class="form-group">
							<label>EMAIL</label>
		               		<input type="text" name="email" value="${member.email }"  readonly="readonly"><br>
		               		<span style="color: hotpink;">아이디와 이메일은 변경 할수 없습니다.</span>
               			</div><br><br>
					    <div class="form-group">
							<label>PASSWORD</label>
							<input type="password" name="pw" onchange="pwChk();" required autofocus>
							<span id="pw_check"></span>
						</div>
						
					    </c:otherwise>
					</c:choose>
					<div class="form-group">
					<label>NICKNAME</label>	
						<input type="text" name="nickname" onchange="nicChk();" value="${member.nickname }" >
						<span id="nic_check"></span>
					</div>
					<div>
						<input type="submit"  value="수정" >
					</div>
		</form>
		<form id="img_upload" action="/te/uploadimage.do" method="post" enctype="multipart/form-data" target="img_target">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="member_seq" value="${member.member_seq }">
			<input type="file" name="file" accept="image/*" onchange="imgUpload();">
		</form>
		</sec:authorize>
		</section>
	</div>
	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>