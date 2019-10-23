<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script type="text/javascript" src="/te/resources/js/clock.js"></script>
<script type="text/javascript">

	function enterRoom(tutor_id, my_id, value) {
		var isTutor = (tutor_id == my_id)? "true" : "false";
		if(value == "강의") {
			console.log("강의");
			open("openroom.do?isTutor=" + isTutor + "&tutorId=" + tutor_id + "&myId=" + my_id, "", "");
			
		}else if(value == "과외") {
			console.log("과외");
			open("openroom.do?isTutor=" + isTutor + "&tutorId=" + tutor_id + "&myId=" + my_id, "", "");
		}
	}
</script>
<nav>
	<div class="TE_mypage_nav">
		<img alt="" src="${member.profile_img }"/>
		<h3>${member.nickname }</h3>
		<a href="">id</a>
		<div class="TE_mypage_nav_btn">
			<!-- enterRoom(튜터 아이디 , 자기 아이디, 로 바꿔야함) -->
			<input type="button" value="강의" onclick="enterRoom('${tutor }', '${member.id}', this.value);"/>
			<input type="button" value="과외" onclick="enterRoom('${tutor }', '${member.id}', this.value);"/>
		</div>
	</div>
	<div class="TE_mypage_nav">
		<c:choose>
			<c:when test="${member != 'anonymousUser'}">
				<c:if test="${tutor == member.id }">
					<a href="./mypageinfo.do">내 정보</a>
				</c:if>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<a href="./calendar.do">스케쥴</a>
		<a href="">VOD</a>
	</div>
	<div id="clock" style="padding: 10px;"></div>
</nav>