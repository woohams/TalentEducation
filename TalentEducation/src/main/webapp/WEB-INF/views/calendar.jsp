<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/mypage.css">
		
		<link rel="stylesheet" href="resources/css/calendar.css">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" rel="stylesheet" type="text/css" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" rel="stylesheet" type="text/css" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.css" rel="stylesheet" type="text/css" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" rel="stylesheet" type="text/css" />
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/	4.2.0/moment/main.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>

    	<script type="text/javascript">

    	$(document).ready(function() {
    		setCalendar();
    	});

    	function setCalendar(){
    		    		
    		var calendarEl = document.getElementById('calendar');

    		var calendar = new FullCalendar.Calendar(calendarEl, {
    			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
    			header: {
    				left: 'prev,next today',
    				center: 'title',
    				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    			},
    			defaultView: 'timeGridWeek',
    			locale: 'ko',
    			navLinks: true, 
    			editable: true,
    			allDaySlot: false,
    			eventLimit: true, 
    			minTime: '00:00:00',
    			maxTime: '24:00:00',
    			contentHeight: 'auto',
    			eventSources: [{
    				events: function(info, successCallback, failureCallback) {
    					$.getJSON( "", function( data ) {		// ./resources/data/selectEventList.json				
    						successCallback(data);
    					});
    				}
    			}]
    		});
    				
    		calendar.render();

    	}

    	</script>
		
	</head>
	
	
	
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="mypage_form">
		<%@ include file="/resources/template/mypage_nav.jsp" %>
		<section style="height:855px; overflow-y: scroll; margin-top: 40px;">
			<div id="calendar"></div>			
		</section>
	</div>

	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>




