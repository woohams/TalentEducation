  	 // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('808a4ad14575a8270f3f0148a670dc9c');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
   container: '#kakao-login-btn',
   success: function(authObj) {
     Kakao.API.request({
       url: '/v1/user/me',
       success: function(res) {
             
             var member_id = "KAKAOSNSID"+res.id;
             var member_pw = "KAKAOSNSID"+res.id;
             var member_email = "KAKAOEMAIL"+res.kaccount_email;
             var member_nickname = "KAKAONICK"+res.properties['nickname'];
             
             $.ajax({
            	type: "POST",
            	url: "snslogin.do?id="+member_id+"&pw="+member_pw+"&email="+member_email+"&nickname="+member_nickname,
            	dataType : "Json",
            	beforeSend : function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    			},
    			success : function(data){
    				$("#snsId").val(id);
    				$("#snsPw").val(pw);
    				$("#snsLogin").submit();
    			}
             });
           }
         });
       },
       fail: function(error) {
         alert(JSON.stringify(error));
       }
     });
    
	var naver_id_login = new naver_id_login("CQCVSo1bGXvj408kAJib", "http://localhost:8787/te/naverlogin.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setPopup();
  	naver_id_login.setButton("green", 3, 49);
  	naver_id_login.setDomain("http://localhost:8787/te/naverlogin.do");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
    