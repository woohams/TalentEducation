
var token;
var header;
var pattern_Pw = /^(?=.*[a-zA-Z!@#$%^*+=-])([ㄱ-ㅎ|ㅏ-ㅣ|가-힣])(?=.*[0-9]).{6,10}$/;
var pattern_Id = /^[a-z0-9]{4,10}$/;
var pattern_get=/(?=.*[0-9]).{6,10}$/;
var pattern_gon = /\s/g;
var pattern_num = /[0-9]/;	 
var pattern_eng = /[a-zA-Z]/;	
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; 
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
var pattern_email = /^[a-z0-9A-Z]{1,30}$/;
var pattern_nic = /^[ㄱ-ㅎ가-힣A-Za-z0-9!@#$%^*+=-]{1,14}$/;

window.onload=function(){
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}

function idChk() {

	var user_id = $("input[name=id]").val();
	
	if(!pattern_Id.test(user_id)||(pattern_gon.test(user_id))){
		$("#id_check").css('color', 'red');
		$("#id_check").html("ID : 4~10 공백,한글,특수기호 X");
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
	
	
	if((pattern_gon.test(pw))&&(pattern_spc.test(pw))&&(pattern_kor.test(pw))&&(pattern_get.test(pw))){
		$("#pw_check").css('color', 'red');
		$("#pw_check").html("PW: 6~10자 써주새요");
		$("input[name=pw]").focus();
	
		return false;
	}else{
		$("#pw_check").css('color', 'blue');
		$("#pw_check").html("사용가능한 password 입니다.");
		$("input[name=email]").focus();
		
		return false;			
	}
	
}

function nicChk(){
	var nic = $("input[name=Nickname]").val();
	
	if(!pattern_nic.test(nic)){
		$("#nic_check").css('color', 'red');
		$("#nic_check").html(" 공백은 사용불가능합니다.");
		$("input[name=Nickname]").focus();
		return false;
	}else{
		$("#nic_check").css('color', 'blue');
		$("#nic_check").html("사용가능한 닉네임 입니다.");
		return false;
	}
	
} 

function emailSelect(){
	$("#selectEmail option:selected").each(function(){
		if($(this).val() == "write"){
			$("#emailService").val("");
			$("#emailService").attr("disabled", false);
		}else{
			$("#emailService").val($(this).text());
			$("#emailService").attr("disabled", true);
		}
	});
}

function emailChk(){
	
	if($("#emailId").val() == ""){
		alert("email을 입력해주세요!");
		return false;
	}
	
	if(!pattern_email.test($("#emailId").val())){
		alert("email을 형식에 맞게 입력해주세요");
		return false;
	}else{
		$("input[name=email]").val($("#emailId").val() + "@" + $("#emailService").val());
		email = $("input[name=email]").val();
		window.open("./emailchkP.do","emailChkPage","width=500, height=150, left=500, top=250", "resizeble=no", "alwaysReised=yes");			
	}
}

	