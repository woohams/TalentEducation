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
			<div class="slide">
		    	<input type="radio" name="pos" id="pos1" checked>
				<input type="radio" name="pos" id="pos2">
				<input type="radio" name="pos" id="pos3">
				<input type="radio" name="pos" id="pos4">
				    
			    <ul>
			      <li><img alt="" src="resources/images/study1.jpg" class="section1" /></li>
			      <li><img alt="" src="resources/images/study2.jpg" class="section1" /></li>
			      <li><img alt="" src="resources/images/study3.jpg" class="section1" /></li>
			      <li><img alt="" src="resources/images/study4.jpg" class="section1" /></li>
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
			<div class="w3-container">
			</div>

			<div class="w3-content" style="max-width: 800px;">
				<div style = "width: 400px; margin: 0 auto; padding-top: 100px;">
				  	<img class="mySlides" src="resources/images/teacher1introduce.png" style="width:500px; height:550px; display:block" />
				  	<img class="mySlides" src="resources/images/teacher2introduce.png" style="width:500px; height:550px; display:none" />
				  	<img class="mySlides" src="resources/images/teacher3introduce.png" style="width:500px; height:550px; display:none" />
			  	</div>
			
			  	<div class="w3-row-padding w3-section">
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/teacher1.PNG" style="width:50%; height:15%; cursor:pointer" onclick="currentDiv(1)" />
			    	</div>
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/teacher2.PNG" style="width:50%; height:15%; cursor:pointer" onclick="currentDiv(2)" />
			    	</div>
			    	<div class="w3-col s4">
			      		<img class="te w3-opacity w3-hover-opacity-off" src="resources/images/teacher3.PNG" style="width:50% ;height:15%; cursor:pointer" onclick="currentDiv(3)" />
			    	</div>
			  	</div>
			</div>
			
		</section>
		<section>
			<div id="daumRoughmapContainer1571829518237" class="root_daum_roughmap root_daum_roughmap_landing" style="padding-top:100px; background:white; margin: 0 auto;"></div>
		</section>
		<section>
			<div style="position:relative; height:100%; text-align: center;">
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
