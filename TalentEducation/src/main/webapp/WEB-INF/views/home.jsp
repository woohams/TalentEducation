<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<%@ include file="/resources/template/head.jsp" %>
	<link rel="stylesheet" href="resources/css/full-page-scroll.css">
	<link rel="stylesheet" href="resources/css/home.css">
	
</head>
<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="main" class="scroll-container">
		<section>			
			<div class="slide">
		    	<input type="radio" name="pos" id="pos1" checked>
				<input type="radio" name="pos" id="pos2">
				<input type="radio" name="pos" id="pos3">
				<input type="radio" name="pos" id="pos4">
				    
			    <ul>
			      <li><img alt="" src="resources/images/study1.jpg" class="section1" style="width:75%; height:90%; padding-top:55px;" /></li>
			      <li><img alt="" src="resources/images/study2.jpg" class="section1" style="width:75%; height:90%; padding-top:55px;" /></li>
			      <li><img alt="" src="resources/images/study3.jpg" class="section1" style="width:75%; height:90%; padding-top:55px;" /></li>
			      <li><img alt="" src="resources/images/study4.jpg" class="section1" style="width:75%; height:90%; padding-top:55px;" /></li>
		  	  	</ul>
		  	  	
			    <p class="bullet">
			      <label for="pos1">1</label>
			      <label for="pos2">2</label>
			      <label for="pos3">3</label>
			      <label for="pos4">4</label>
			    </p>	    
			    
 			</div>
		</section>
		
		<section>
			<div style="text-align: center;">
				<a href="#"><img alt="" src="resources/images/music.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/video.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/beauty.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/design.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/workingcapacity.png" class="section2" /></a>
			</div>
		</section>
		<section>
		</section>
		<section>
		</section>
	</div>
	<script type="text/javascript" src="resources/js/full-page-scroll.js"></script>
	<script type="text/javascript">
		new fullScroll({
			displayDots: true,
			dotsPosition: 'left',
			animateTime: 0.7,
			animateFunction: 'ease'
		});
	</script>
</body>
</html>
