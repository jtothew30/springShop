<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>cart page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function selPayRequest() {
		var chk = document.getElementsByClassName("chk");
		var cnt = 0;
		var chklist = new Array();
		for(var i=0; i<chk.length; i++){
			if(chk[i].checked){
				cnt++;
				chklist.push(chk[i].value);
			}
		}
		
		alert(JSON.stringify(chklist));
	}
</script>
</head>
<body>
	
	<div class="chkclass">
		<table>	
		<c:forEach var="cart" items="${cartlist}">
			<tr>
				<td width="35%"><input type="checkbox" class="chk" value="${cart.pno}"><strong style="font-size:15pt;">${cart.pname}</strong> - ${cart.options}</td>
				<td width="35%">상품 글 보러 가기 <a href="../proboard/product.do?pbno=${cart.pbno}">${cart.title}</a></td>
				<td width="20%">가격/수량 : ${cart.price}/${cart.count}</td>
				<td width="10%">합계 : <span id="price${cart.pno}">${cart.count * cart.price}</span></td>
			</tr>
		</c:forEach>
			<tr align="center">
				<td width="25%" style="font-size:17pt; font-weight:900;">주문금액 : xxxxx원</td>
				<td width="25%" style="font-size:17pt; font-weight:900;">할인금액 : xxxxxx원</td>
				<td colspan="2" width="50%" style="font-size:17pt; font-weight:900;">총 결제예정금액 : xxxxx원</td>
			</tr>
		</table>
	</div>
	<input type="button" onclick="selPayRequest()" value="선택상품주문">
	<input type="button" onclick="allPayRequest()" value="전체주문">
	
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
