<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">

	var naver_id_login = new naver_id_login("CQCVSo1bGXvj408kAJib", "http://localhost:8787/te/naverlogin.do");
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	function naverSignInCallback() {
	  
	  var member_id = "NAVER@"+naver_id_login.getProfileData('id');
      var member_pw = "SNS@PW"
      var member_email = "NAVER@"+naver_id_login.getProfileData('email');
      var member_nickname = "NAVER@"+naver_id_login.getProfileData('nickname');
      var member_profile_image = naver_id_login.getProfileData('profile_image')
      $.ajax({
     	type: "POST",
     	url: "snslogin.do?id="+member_id+"&pw="+member_pw+"&email="+member_email+"&nickname="+member_nickname+"&profile_image="+member_profile_image,
     	dataType : "Json",
     	beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data){
				$("#snsId",opener.document).val(member_id);
				$("#snsPw",opener.document).val(member_pw);
				$("#snsLogin",opener.document).submit();
				window.self.close();
			}
      });

	}


</script>
</head>
<body>

</body>
</html>