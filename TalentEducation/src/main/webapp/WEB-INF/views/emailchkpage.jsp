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

var emailCode;

$(function() {
	var email = window.opener.email;
	$.ajax({
		type: "POST",
		url: "./emailchk.do?email="+email,
		dataType: "JSON",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success : function(data){
        	alert(data.toString())
        	emailCode = data;            	
        },
        error : function(){
        	alert("통신실패");
        }
	});
});


function emailConfirm(){
	
	if($("#emailCode").val() == ""){
		alert("인증번호를 입력해주세요");
		return false;
	}
	if($("#emailCode").val() == emailCode){
		window.opener.emailConfirm = true;
		$("#emailId",opener.document).attr("disabled", true);
		$("#emailService",opener.document).attr("disabled", true);
		$("#selectEmail",opener.document).css("display", "none");
		$("#emailBtn",opener.document).css("display", "none");
		$("#emailck",opener.document).css("color", "blue");
		$("#emailck",opener.document).html("인증완료");
		alert("인증성공!");
		window.self.close();			
		return false;
	}else{
		alert("인증번호가 틀립니다!");
		return false;
	}
	
}


</script>
</head>
<body style="text-align: center;">
<br/>
인증 코드를 입력해주세요<br/><br/>
<input type="text" id="emailCode" /> &nbsp;
<input type="button" value="인증" onclick="emailConfirm();" /> 
</body>
</html>