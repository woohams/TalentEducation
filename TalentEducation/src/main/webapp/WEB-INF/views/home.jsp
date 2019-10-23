<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<%@ include file="/resources/template/head.jsp" %>
	<link rel="stylesheet" href="resources/css/full-page-scroll.css">
	<link rel="stylesheet" href="resources/css/home.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="main" class="scroll-container">
		<section>			
			<div class="slide" style="padding-top:130px;">
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
 			<div style="text-align: center; background-color:white;">
				<a href="#"><img alt="" src="resources/images/music.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/video.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/beauty.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/design.png" class="section2" /></a>
				<a href="#"><img alt="" src="resources/images/workingcapacity.png" class="section2" /></a>
			</div>
		</section>
		
		<section>
			<div class="w3-container">
			  <h2> ' </h2>
			  <h1>강   사   진   소   개</h1>
			</div>

			<div class="w3-content" style="max-width:800px;">
			  	<img class="mySlides" src="resources/images/afreeca1.png" style="width:50%; display:none" />
			  	<img class="mySlides" src="resources/images/afreeca2.png" style="width:50%; display:none" />
			  	<img class="mySlides" src="resources/images/afreeca3.png" style="width:50%; display:none" />
			
			  	<div class="w3-row-padding w3-section">
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/bj1.png" style="width:50%; height:15%; cursor:pointer" onclick="currentDiv(1)" />
			    	</div>
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/bj2.jpg" style="width:50%; height:15%; cursor:pointer" onclick="currentDiv(2)" />
			    	</div>
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/bj3.jpg" style="width:50% ;height:15%; cursor:pointer" onclick="currentDiv(3)" />
			    	</div>
			  	</div>
			</div>
			
		</section>
		<section>
			<div id="daumRoughmapContainer1571829518237" class="root_daum_roughmap root_daum_roughmap_landing" style="padding-top:100px; background:white;"></div>
		</section>
		<section>
			<div style="position:relative; height:100%;">
			<img src="resources/images/book.jpg" style="padding-top: 200px; height: 600px; width:700px;" />
				<div id="bookSite">
					<a href="http://www.aladin.co.kr/home/welcome.aspx" >
		        		<img src="resources/images/book1.jpg" class="section4"/></a>
		   			<a href="http://www.kyobobook.co.kr/index.laf" >
				        <img src="resources/images/book2.jpg" class="section4"/></a>
		    		<a href="http://book.interpark.com/bookPark/html/book.html‎" >
				       	<img src="resources/images/book3.jpg" class="section4"/></a>
		   			<a href="http://www.yes24.com/main" >
				        <img src="resources/images/book4.png" class="section4"/></a>
			   	</div>
		   	</div>
		</section>
	</div>
	<script type="text/javascript" src="resources/js/full-page-scroll.js"></script>
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	<script type="text/javascript" src="resources/js/home.js"></script>
</body>
</html>
