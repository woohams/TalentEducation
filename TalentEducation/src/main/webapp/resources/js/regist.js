
var token;
var header;
var pattern_Pw = /^(?=.*[a-zA-Z!@#$%^*+=-])(?=.*[0-9]).{6,10}$/;
var pattern_Id = /^[a-z0-9]/;
var pattern_gon = /\s/g;
var pattern_num = /[0-9]/;	 
var pattern_eng = /[a-zA-Z]/;	
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; 
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 

window.onload=function(){
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}

function idChk() {

	var user_id = $("input[name=id]").val();
	
	if(!pattern_Id.test(user_id)||(pattern_gon.test(user_id))){
		$("#id_check").css('color', 'red');
		$("#id_check").html("공백, 특수문자, 한글, 대문자는 사용불가능합니다.");
		$("input[name=id]").focus();
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: "./idchk.do",
		dataType : "JSON",
		data : "id="+user_id,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);            
			},
		success : function(data) {						
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").css("color", "red");
					$("#id_check").html("사용중인 ID 입니다 ");
					$("input[name=id]").focus();
					
					return false;
				} else {
					$("#id_check").css('color', 'blue');
					$("#id_check").html("사용가능한 ID 입니다");
					$("input[name=pw]").focus();
					
					return false;
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
}

function pwChk(){
	var pw = $("input[name=pw]").val();
	
	
	if(!pattern_Pw.test(pw)){
		$("#pw_check").css('color', 'red');
		$("#pw_check").html("문자와 숫자를 혼합하여 6~10자로 입력하세요");
		$("input[name=pw]").focus();
	
		return false;
	}else{
		$("#pw_check").css('color', 'blue');
		$("#pw_check").html("사용가능한 password 입니다.");
		$("input[name=email]").focus();
		
		return false;			
	}
	
}

	