<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>paymentResult page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	
</script>
</head>
<c:import url="../header.jsp" />
<body>
<div style="margin: 0% 10%;">      
      <div style="text-align: center">
	<table>
		<tr>
			<td>결제 번호</td>
			<td>${payment.payno}</td>
		</tr>
		<tr>
			<td>결제 상품 정보</td>
			<td>${payment.payname}</td>
		</tr>
		<tr>
			<td>주문 날짜</td>
			<td>${payment.paydate}</td>
		</tr>
		<tr>
			<td>결제 금액</td>
			<td>${payment.total}</td>
		</tr>
		<tr>
			<td>주문하신 분</td>
			<td>${payment.customer}</td>
		</tr>
		<tr>
			<td>받으시는 분</td>
			<td>${payment.recipient}</td>
		</tr>
		<tr>
			<td>주 소</td>
			<td>${payment.address1}<br>${payment.address2}</td>
		</tr>
		<tr>
			<td>요청 사항</td>
			<td>${payment.memo}</td>
		</tr>	
	</table>
	</div>
	</div>
	
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.1.1.min.js" type="application/javascript"></script>
</body>
<c:import url="../footer.jsp" />
</html>



