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

</head>
<body  style="text-align: center;">
	<h2 style="font-size: large;">가입시 인증받은 아이디와 이메일 <br/>주소를 입력해주세요<br/></h2>
<form action="./sendMailpw.do" id="findForm" method="post">
   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <div class="box id">
             <input type="text" id="id" name="id" placeholder="ID를 적어주세요." autofocus autocomplete="off" required />
        </div>
        <div class="box email">
             <input type="text" id="email" name="email" placeholder="Email를 적어주세요." autofocus autocomplete="off" required />
        </div>
        <div class="box captcha">
            <input type="text" id="captcha" name="captcha" placeholder="자동 방지 코드" autocomplete="off" required />
            <h3 style="color: red; font-size: 12px;">${resultMsg}</h3>
            <img class="loading" src="./captcha" alt="캡차 이미지" title="클릭시 새로고침" />
        </div>
        <br>
        <div class="box btn">
            <button type="submit" class="btn join" >
                <i class="fa fa-envelope"></i>
                이메일 전송
            </button>
        </div>
    
</form>
</body>
</html>