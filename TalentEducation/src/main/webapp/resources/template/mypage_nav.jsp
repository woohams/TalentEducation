<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script type="text/javascript" src="resources/js/clock.js"></script>
<script type="text/javascript">

	function enterRoom(tuter_id, my_id, value) {
		var isTuter = (tuter_id == my_id)? "true" : "false";
		if(value == "강의") {
			console.log("강의");
			open("openroom.do?isTuter=" + isTuter + "&tuterId=" + tuter_id + "&myId=" + my_id, "", "");
			
		}else if(value == "과외") {
			console.log("과외");
			open("openroom.do?isTuter=" + isTuter + "&tuterId=" + tuter_id + "&myId=" + my_id, "", "");
		}
	}
</script>
<nav>
	<div class="TE_mypage_nav">
		<img alt="" src="resources/images/sample.jpg"/>
		<h3>닉네임</h3>
		<a href="">id</a>
		<div class="TE_mypage_nav_btn">
			<!-- enterRoom(튜터 아이디 , 자기 아이디, 로 바꿔야함) -->
			<input type="button" value="강의" onclick="enterRoom('user', 'user', this.value);"/>
			<input type="button" value="과외" onclick="enterRoom('user', 'dd1', this.value);"/>
		</div>
	</div>
	<div class="TE_mypage_nav">
		<a href="./mypageinfo.do">내 정보</a>
		<a href="./calendar.do">스케쥴</a>
		<a href="">VOD</a>
	</div>
	<div id="clock" style="padding: 10px;"></div>
</nav>