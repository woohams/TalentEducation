<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/resources/template/head.jsp" %>
		<link rel="stylesheet" href="resources/css/mypage.css">
		
		<link rel="stylesheet"  href="resources/css/fullcalendar.css"  />  
		<link rel="stylesheet" href="resources/css/calendar.css">
		<!-- 풀캘린더-3.10.0 버전 사용했음 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
		<script src="resources/js/fullcalendar.js"></script>
		<script type="text/javascript">
		
		var activeInactiveWeekends = true;
		
    	$(function () {
    		// page is now ready, initialize the calendar...
    		$('#calendar').fullCalendar({
    			// put your options and callbacks here
    			
    		// 주말
    		customButtons: {
    			viewWeekends: {
	      		text: 'weekends',
	      		click: function () {
	        		activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
	        		$('#calendar').fullCalendar('option', {
	          			weekends: activeInactiveWeekends
	        		});
	      		}
	    	}
	  	},
    			
    		/* header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,listMonth'
            }
    		, */
    		header: {
    		    left: 'today, prevYear, nextYear, viewWeekends',
    		    center: 'prev, title, next',
    		    right: 'month,agendaWeek,agendaDay,listWeek'
    		  },
    		  views: {
    		    month: {
    		      columnFormat: 'dddd'
    		    },
    		    agendaWeek: {
    		      columnFormat: 'M/D ddd',
    		      titleFormat: 'YYYY년 M월 D일',
    		      eventLimit: false
    		    },
    		    agendaDay: {
    		      columnFormat: 'dddd',
    		      eventLimit: false
    		    },
    		    listWeek: {
    		      columnFormat: ''
    		    }
    		  },
    		defaultDate: moment().format('YYYY-MM-DD')	//defaultDate (캘린더 처음 로드되면 보여줄 날짜)
    		,
    		locale: 'ko'								//한국으로 장소 설정
    		,
    		editable: true								//캘린더의 이벤트를 수정할 수 있는지 여부. default는 false.
    		,
    		navLinks: true								//요일 이름과 타이틀 이름을 클릭 할 수 있는지 여부를 결정. default는 false.
    		,
    		eventLimit: true							//하루에 표시되는 이벤트 수를 제한. default는 false.
    		,
    		allDaySlot: false							//"하루 종일"슬롯이 표시되는지 여부를 결정. default는 false.
    		,
    		contentHeight: 'auto'						//달력 의 보기 영역 높이를 설정
    		,
    		dayClick: function() {						//날짜 눌렀을 때 펑션. 여기서는 일정 추가 창이 뜨도록 했음.
    			
    			window.open("eventuploadform.jsp","","left=600px,top=50px,width=600px,height=300px");
    			
       		}
    		,
    		eventClick: function(event) {				//일정 클릭하면 실행되는 펑션
    			window.open("calendarDetail.do?id="+event.id,"","left=600px,top=50px,width=600px,height=300px");
    		}
    		,
    		eventDrop: function(event , delta , revertFunc , jsEvent , ui , view){		//일정 마우스로 드래그앤 드랍으로 수정하는거
    			if(event.end == null){				//end가 null이면
    				event.end = event.start;		//start랑 동일한 날짜로 (null에는 밑에 format()적용이 안돼서 오류남!)
    			}
    			$.ajax({
    				url:"calendarDragUpdate.do",
    				data:"id="+event.id+"&start="+event.start.format()+"&end="+event.end.format(),		//뒤에 format() 안해주면 컨트롤러에 날짜 형식 이상하게 넘어감
    				dataType:"text",
    				success:function(dropDate){
    						alert(dropDate);
    				}
    			});
    		}
    		,
    		eventResize: function(event , delta , revertFunc , jsEvent , ui , view){			//일정 늘리고 당기고 하는거
    			$.ajax({
    				url:"calendarDragUpdate.do",
    				data:"id="+event.id+"&start="+event.start.format()+"&end="+event.end.format(),
    				dataType:"text",
    				success:function(dropDate){
    						alert(dropDate);
    				}
    			});
    		},
    		events: function(start, end, timezone, callback) {
    		    $.ajax({
    		    	url: 'calendarlist.do',
    		    	dataType:'text',
    		    	success: function(data){
    		    		var parse = JSON.parse(data);
    		    		var events = [];

    		    		$(parse).each(function(){
    		    			
    		    			events.push({	
    		    				id: $(this).attr('id'),
    		    				title: $(this).attr('title'),
     		    				description: $(this).attr('description'),
     		    				start: $(this).attr('start'),
    		    				end: $(this).attr('end'),
    		    			});
    		    		});
    		    		callback(events);
    		    	}	//success end
    		    });
    		  },
    		  
    		 		 // drag & drop
    		  
    			  
    			  //url: 'dragNdropUpdate.do',
    			  
	    		  editable: true,
	    		  eventDrop: function(event, delta, revertFunc) {
	
	    			    alert(event.title + " 을(를) " + event.start.format() + "일로 변경합니다.");
	
	    			    if (!confirm("정말로 변경하시겠습니까 ? ")) {
	    			      revertFunc();
	    			    }
	    			  },
    		  
    		  
    		loading: function(bool) {					//이벤트 또는 리소스 가져 오기가 시작 / 중지 될 때 실행 됨.
                $('#loading').toggle(bool);				//loading.. 글자 뜨게 만드는
            }

    			
    		});	//fullcalendar end
    	});	//$(function) end
    	
    	
    	
    	
    	</script>
		
	</head>
	
	
	
	<body>
	<%@ include file="/resources/template/header.jsp" %>
	<div id="mypage_form">
		<%@ include file="/resources/template/mypage_nav.jsp" %>
		<section style="height:855px; margin-top: 40px;">
			<div id="calendar" style="width:1000px;"></div>			
		</section>
	</div>

	<%@ include file="/resources/template/footer.jsp" %>
	</body>
</html>




