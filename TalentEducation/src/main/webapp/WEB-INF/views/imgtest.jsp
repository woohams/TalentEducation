<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	onload = function() {
		opener.document.getElementById("mainImg").setAttribute("src", "/te/resources/images/upload/${imgName}");
		opener.document.getElementById("hiddenImg").setAttribute("value", "/te/resources/images/upload/${imgName}");
		close();
		
	}
</script>
</body>
</html>