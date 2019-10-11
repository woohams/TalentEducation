$(function() {
	var date = new Date();
	
	var sec = date.getSeconds() * 6 + 180;
	var min = date.getMinutes() * 6 + 180;
	var hour = ((date.getHours() > 11)? date.getHours()-12 : date.getHours()) * 30 + 180;
	
	var svg = d3.select("#clock")
	    .append("svg")
	    .attr("width", 200)
	    .attr("height", 200)
	    .style("background-image", "url('resources/images/clock.jpg')")
	    .style("background-size", "200px");
	
	var rect = svg.append("rect")
	    .attr("id", "sec")
	    .attr("width", 1)
	    .attr("height", 90)
	    .attr("fill", "red")
	    .attr("transform", "translate(100,100) rotate("+ sec +")");
	
	var rect2 = svg.append("rect")
	    .attr("id", "min")
	    .attr("width", 3)
	    .attr("height", 80)
	    .attr("fill", "rgb(100,100,100)")
	    .attr("transform", "translate(101,100) rotate("+ min +")");
	
	var rect3 = svg.append("rect")
	    .attr("id", "hour")
	    .attr("width", 5)
	    .attr("height", 50)
	    .attr("fill", "black")
	    .attr("transform", "translate(99,100) rotate("+ hour +")");
	
	var circle = svg.append("circle")
	    .attr("cx", 100)
	    .attr("cy", 100)
	    .attr("r", 10);
	
	function rota() {
	    sec += 6;
	    if(sec == 540) {
	        sec = 180;
	        min += 6;
	        if(min == 540) {
	            min = 180;
	            hour += 30;
	            if(hour == 540) hour = 180;
	            document.getElementById("hour").setAttribute("transform", "translate(99,100) rotate(" + hour + ")");        
	        }
	        document.getElementById("min").setAttribute("transform", "translate(101,100) rotate(" + min + ")");    
	    }
	    document.getElementById("sec").setAttribute("transform", "translate(100,100) rotate(" + sec + ")");
	}
	setInterval(rota, 1000);
});