<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <% String calendar_start = request.getParameter("calendar_start"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="/resources/template/head.jsp" %>
	<script type="text/javascript" src="/te/resources/js/calendar.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<link rel="stylesheet" href="/te/resources/css/eventinsert.css">
	<script src="/te/resources/js/fullcalendar.js"></script>
	<script type="text/javascript" src="/te/resources/js/ko.js"></script>
</head>
<body>
	
	<sec:authentication property="principal" var="member" />
	<form action="/te/calendarInsert.do" id="insertForm" method="post">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
	<input type="hidden"  name="id"   value="${member.id }"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td id="category">
					<div class="form-check">
						<label class="form-check-label">
							<select name="calendar_category" id="edit-category">
		                     	<option value="디자인">디자인</option>
		                      	<option value="실무역량">실무역량</option>
		                       	<option value="뷰티">뷰티</option>
		                       	<option value="영상">영상</option>
		                       	<option value="음악">음악</option>
		                       	<option value="기타">기타</option>
		                  	 </select>
		               	</label>
		          	</div>
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td id="color">
					<div class="form-check">
						<label class="form-check-label">
							<select name="calendar_color" id="edit-color">
								<option value="#D25565" style="color:#D25565;">빨간색</option>
		                    	<option value="#9775fa" style="color:#9775fa;">보라색</option>
		                      	<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                       	<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                       	<option value="#f06595" style="color:#f06595;">핑크색</option>
		                       	<option value="#63e6be" style="color:#63e6be;">연두색</option>
		                       	<option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                       	<option value="#4d638c" style="color:#4d638c;">남색</option>
		                       	<option value="#495057" style="color:#495057;">검정색</option>
		                  	</select>
		              	</label>
		          	</div>
				</td>
			</tr>
			<tr>
				<th>시작</th>
				<td><input type="date" name="calendar_start" value="<%=calendar_start%>"></td>
			</tr>
			<tr>
				<th>끝</th>
				<td><input type="date" name="calendar_end"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="calendar_description"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" class="buttontd">
					<button type="submit" onclick="viewClose();">등록</button>
					<button  onclick="viewClose();">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>