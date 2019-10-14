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
</script>

</head>
<body>
	
		<form action="calendarUpdateRes.do" method="post">
		<input type="hidden" name="calendar_seq" value="${calendarDto.calendar_seq }">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title" value="${calendarDto.calendar_title }"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="calendar_category" value="${calendarDto.calendar_category }"></td>
			</tr>
			<tr>
				<th>시작</th>
				<td><input type="date" name="calendar_start" value="${calendarDto.calendar_start }"></td>
			</tr>
			<tr>
				<th>끝</th>
				<td><input type="date" name="calendar_end" value="${calendarDto.calendar_end }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="calendar_description">${calendarDto.calendar_description }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="viewClose();">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>