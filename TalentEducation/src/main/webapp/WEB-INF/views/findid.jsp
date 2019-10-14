<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">

// captcha 새로고침
$("#findForm .box.captcha img").click(function() {
	$("#findForm .box.captcha .loading").show();
    $(this).attr("src", "./captcha?ran=" + Math.random());
    $("#findForm .box.captcha .loading").fadeOut(500);
});

</script>
</head>
<body>
	가입시 인증받은 이메일 주소를 입력해주세요<br/>
<form action="./sendMailid.do" id="findForm" method="post">
   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <div class="box email">
            <!-- <label for="email">이메일</label>
             -->
             
               <input type="text" id="email" name="email" placeholder="Email를 적어주세요." autofocus autocomplete="off" required />
        </div>
        <!-- // .box.email -->
 
        <div class="box captcha">
          
            <!-- // .loading   <div class="loading"></div> -->
 
            <input type="text" id="captcha" name="captcha" placeholder="자동 방지 코드" autocomplete="off" required />
            <img class="loading" src="./captcha" alt="캡차 이미지" title="클릭시 새로고침" />
        </div>
        <!-- // .box.captcha -->
 
        <div class="box btn">
            <button type="submit" class="btn join" >
                <i class="fa fa-envelope"></i>
                이메일 전송
            </button>
        </div>
        <!-- // .box.btn -->
    
</form>
</body>
</html>