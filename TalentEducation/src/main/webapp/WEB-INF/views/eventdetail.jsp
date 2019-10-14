<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function viewClose(){
		opener.location.reload();
		close();
	}
	
	function eventDel(){
		location.href='calendarDelete.do?id=${calendarDto.calendar_seq}';
		alert("삭제 되었습니다.");
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
				<td colspan="2">
					<input type="button" value="수정" onclick="location.href='calendarUpdate.do?id=${calendarDto.calendar_seq}'">
					<input type="button" value="삭제" onclick="eventDel();">
					<input type="button" value="취소" onclick="viewClose();">
				</td>
			</tr>
		</table>
	
	
	
</body>
</html>