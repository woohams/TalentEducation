<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     [${approved_at}]<br/>
주문번호:    [${partner_order_id}]<br/>
상품명:    [${item_name}]<br/>
상품수량:    [${quantity}]<br/>
결제금액:    [${amount}]<br/>
결제방법:    [${payment_method_type}]<br/> 

<input type="button" onclick="location.href='boardlist.do'" value="리스트로 이동"/>
</body>
</html>