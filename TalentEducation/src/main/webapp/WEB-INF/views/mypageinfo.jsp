<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/mypage.css">
		<script type="text/javascript" >
		var pwConfirm = 0;
		var nickConfirm = 0;
		var pattern_Pw = /^(?=.*[a-zA-Z!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
		var pattern_nic = /^[ㄱ-ㅎ가-힣A-Za-z0-9!@#$%^*+=-]{1,14}$/;
		
		function pwChk(){
			var pw = $("input[name=pw]").val();
			
			
			if(!pattern_Pw.test(pw)){
				$("#pw_check").css('color', 'red');
				$("#pw_check").html("PW : 6~15 문자,숫자 혼합");
				$("input[name=pw]").focus();
				pwConfirm = 0;
				return false;
			}else{
				$("#pw_check").css('color', 'darkorange');
				$("#pw_check").html("사용가능한 password 입니다.");
				$("input[name=email]").focus();
				pwConfirm = 1;
				return false;			
			}
			
		}

		function nicChk(){
			var nic = $("input[name=Nickname]").val();
			if(!pattern_nic.test(nic)||pattern_gon.test(nic)){
				$("#nic_check").css('color', 'red');
				$("#nic_check").html(" 공백은 사용불가능합니다.");
				$("input[name=Nickname]").focus();
				nickConfirm = 0;
				return false;
			}else{
				$("#nic_check").css('color', 'darkorange');
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

		
		
		</script>
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
					<label>ID</label>
						<input type="text"  name="id" value="${member.id }"  readonly="readonly" >
						<span>아이디는 변경 할수 없습니다.</span>
					</div>
					<c:set var="pw" value="${member.pw}" />
					<c:choose>
					    <c:when test="${ pw eq 'SNS@PW'}">
					        <input type="password" name="pw" value="SNS로그인 사용자는 홈페이지에 가셔서 변경가능합니다." readonly="readonly">
					    </c:when>
					    <c:otherwise>
					    <div class="form-group">
							<label>PASSWORD</label>
							<input type="password" name="pw" onchange="pwChk();" autofocus>
							<span id="pw_check"></span>
						</div>
					    </c:otherwise>
					</c:choose>
					
					<div class="form-group">
					<label>EMAIL</label>
               			<input type="text" name="email" value="${member.email }"  readonly="readonly">
               			 <span>EMAIL은 변경 할수 없습니다.</span>
               		</div>
					<div class="form-group">
					<label>NICKNAME</label>	
						<input type="text" name="nickname" onchange="nicChk();" value="${member.nickname }" >
						<span id="nic_check"></span>
					</div>
					<div class="form-group">
					<label>PROFILE_IMG</label>	
						<input type="text" name="profile_img" value="${member.profile_img }" >
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