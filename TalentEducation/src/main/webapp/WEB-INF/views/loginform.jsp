<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resources/template/head.jsp" %>
<link rel="stylesheet" href="resources/css/loginform.css">
</head>

<%@ include file="/resources/template/header.jsp" %>
<body>

<div id="login_form">
	<div id = "login">
	<form action='/te/login' method="post" id="loginF">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<div class="login-text">
					<input type="text" name="id" placeholder="ID" required autofocus>
				</div>
				<div class="login-text">
					<input type="password" name="pw"  placeholder="Password" required>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				    <font color="red">
				        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
				        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
				    </font>
						</c:if>
				</div><br>
				
					<a href="#" onclick="window.open('./findidpage.do', 'ID찾기', 'width=300, height=250,top=250,left=250,scrollbars= 0, toolbar=0, menubar=no,location=no');">ID찾기</a>&nbsp&nbsp&nbsp
					<a href="#" onclick="window.open('./findpwpage.do', 'PW찾기', 'width=300, height=350,top=300,left=300,scrollbars= 0, toolbar=0, menubar=no,location=no');">PW찾기</a></br>
				</br>
					<input type="submit" value="로그인" class="myButton">&nbsp
					<input type="button" onclick="location.href='/te/regist.do'" value="회원가입" class="myButton"><br>
				</br>
				<div id="sns-button">
					<div id="kakaologo">
						<a id="custom-login-btn" href="javascript:loginWithKakao()" >
							<img src="resources/images/kakao.png" width="40"/>
						</a>
					</div>
					<div id="naverlogo">
						<img src="resources/images/naver.png" onclick="document.getElementById('naver_id_login_anchor').click();" width="40">
					</div>
					<div id="naver_id_login" style="display: none;"></div>
					<div id="googlelogo">
						<img alt="" src="resources/images/google.png" width="40">
					</div>
				</div>
			</form>
				<form id="snsLogin" action='./login' method="post">
			      <input type="hidden"  name="${_csrf.parameterName}"value="${_csrf.token}"/>
			      <input type="hidden" id="snsId" name="id" />
			      <input type="hidden" id="snsPw" name="pw" />	
				</form>
				</div>
</div>
	<script src=" https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> </script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script type="text/javascript">
 	
 	var token;
 	var header;
 	window.onload=function(){
 		token = $('meta[name="_csrf"]').attr('th:content');
 		header = $('meta[name="_csrf_header"]').attr('th:content');
 	}

 	// 사용할 앱의 JavaScript 키를 설정해 주세요.
 	    Kakao.init('6044ab6365d9aad695e70b97c4b85a0d');
 	   function loginWithKakao() {
 	      // 로그인 창을 띄웁니다.
 	      Kakao.Auth.login({
 	   success: function(authObj) {
 	     Kakao.API.request({
 	       url: '/v1/user/me',
 	       success: function(res) {
 	             
 	             var member_id = "KAKAO@"+res.id;
 	             var member_pw = "SNS@PW";
 	             var member_email = "KAKAO@"+res.kaccount_email;
 	             var member_nickname = "KAKAO@"+res.properties['nickname'];
 	             var member_profile_img= res.properties.profile_image;
 	             alert(member_profile_img);
 	             $.ajax({
 	            	type: "POST",
 	            	url: "./snslogin.do?id="+member_id+"&pw="+member_pw+"&email="+member_email+"&nickname="+member_nickname+"&profile_img="+member_profile_img,
 	            	dataType : "JSON",
 	            	beforeSend : function(xhr){
 	    				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 	    			},
 	    			success : function(data){
 	    				$("#snsId").val(member_id);
 	    				$("#snsPw").val(member_pw);
 	    				$("#snsLogin").submit();
 	    			},
 	    			error : function() {
 						console.log("실패");
 				}
 	             });
 	           }
 	         });
 	       },
 	       fail: function(error) {
 	         alert(JSON.stringify(error));
 	       }
 	     });
 	   }
 	    
 		var naver_id_login = new naver_id_login("CQCVSo1bGXvj408kAJib", "http://localhost:8787/te/naverlogin.do");
 	  	var state = naver_id_login.getUniqState();
 	  	naver_id_login.setPopup();
 	  	naver_id_login.setButton("green", 3, 49);
 	  	naver_id_login.setDomain("http://localhost:8787/te/naverlogin.do");
 	  	naver_id_login.setState(state);
 	  	naver_id_login.init_naver_id_login();
 	    
 	</script>
 	
 	<%@ include file="/resources/template/footer.jsp" %>						
</body>
</html>