<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/eventdetail.css">
<script type="text/javascript" src="resources/js/event.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
<script type="text/javascript">
//delete
function eventDel(){
	var result = confirm("삭제 하시겠습니까?");
	location.href="calendarDelete.do?id=${calendarDto.calendar_seq}";
	    if(result){
		    alert("삭제가 성공적으로 완료되었습니다.");
		}else{
		    alert("삭제가 취소되었습니다.");
		}
	    opener.location.reload();
		self.close();
}
</script>

</head>
<body>
	
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${calendarDto.calendar_title }</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>${calendarDto.calendar_category }</td>
			</tr>
			<tr>
				<th>시작</th>
				<td>${calendarDto.calendar_start }</td>
			</tr>
			<tr>
				<th>끝</th>
				<td>${calendarDto.calendar_end }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${calendarDto.calendar_description }</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button onclick="location.href='calendarUpdate.do?id=${calendarDto.calendar_seq}'">수정</button>
					<button onclick="eventDel();">삭제</button>
					<button onclick="viewClose();">취소</button>
				</td>
			</tr>
		</table>
	
	
	
</body>
</html>