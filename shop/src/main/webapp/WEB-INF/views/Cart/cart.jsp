<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>cart page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	var cartlist;	// all my cart list
	var sellist;	// selected production list for payment
	
	$(function(){
		cartlist = new Array();
		<c:forEach var="cart" items="${cartlist}">
			var json = new Object();
			json.pno = "${cart.pno}";
			json.pbno = "${cart.pbno}";
			json.customer = "${cart.customer}";
			json.count = "${cart.count}";
			json.price = "${cart.price}"; 
			cartlist.push(json);
		</c:forEach>
	})
	
	function chkChange(){	// if any check box is changed, 
		var chk = document.getElementsByClassName("chk");
		var total = 0;
		sellist = new Array();
		for(var i=0; i<chk.length; i++){ 
			if(chk[i].checked){			// find all checked production
				for(var j=0; j<cartlist.length; j++){    
					if(chk[i].value == cartlist[j].pno){  // compare with cartlist(all my cart list),
						sellist.push(cartlist[j]);		  // then, push the json data (from cartlist) into sellist
						break;						
					}
				}			
				total += $("#price"+chk[i].value).html()*1;								
			}
		}
		
		$("#selTotalPrice").html(total);
		$("#finalPrice").html(total);
	}
	function selPayRequest() {
		if(!sellist.length){
			swal("결제할 상품을 먼저 선택해주세요!");
			return;
		}
		
		payAlert();
		//alert(JSON.stringify(chklist));
	}
	
	function allPayRequest() {
		var chk = document.getElementsByClassName("chk");
		var total = 0;
		sellist = new Array();
		for(var i=0; i<chk.length; i++){
			chk[i].checked = true;
			sellist.push(cartlist[i]);					
			total += $("#price"+chk[i].value).html()*1;			
		}
		
		$("#selTotalPrice").html(total);
		$("#finalPrice").html(total);
		payAlert();
	}
	
	function payAlert() {
		swal("이대로 결제를 진행하시겠습니까?", {
			  buttons: {				    
			    catch: {
			      text: "결제진행하기",
			      value: "catch",
			    },
			    cancel: "취소",
			  },
			})
			.then((value) => {
			  switch (value) {					 
			    case "catch":
			    	$.ajax({
						type: "POST",
						url: "../payment/payrequest.do",
						data : {'list' : JSON.stringify(sellist)},
						success : function(){
							swal("결제 페이지로 이동합니다.")
							.then((value) => {
								location.href="../payment/paymentPage.do";
							});
						}
					})		    	
			      break;					 
			    default:
			    	break;
			  }
			});	
	}
	
	
	function deleteCart(pname, options, pno) {	
		swal("해당 상품을 장바구니에서 삭제하시겠습니까?", pname+"-"+options,"warning",  {
			  buttons: {				    
			    catch: {
			      text: "삭제하기",
			      value: "catch",
			    },
			    cancel: "취소",
			  },
			})
			.then((value) => {
			  switch (value) {					 
			    case "catch":
			    	$.ajax({
						type: "POST",
						url: "deleteCart.do",
						data : {'pno' : pno},
						success : function(){
							location.reload();
						}
					})		    	
			      break;					 
			    default:
			    	break;
			  }
			});	
	}
	
</script>
</head>
<body>
	
	<div class="chkclass">
		<table>	
			<thead>
			<tr>
				<th>&nbsp;</th> <th>&nbsp;</th> <th style="text-align:center;">장바구니 상품</th> <th style="text-align:center;">가격/수량</th> <th style="text-align:center;">합 계</th>
			</tr>
			</thead>
		<c:forEach var="cart" items="${cartlist}">
			<tr align="center">
				<td width="3%">
					<input type="checkbox" class="chk" onclick="chkChange()" value="${cart.pno}">
				</td>
				<td width="17%">
					<img src="${pageContext.request.contextPath}/resources/upload/${cart.category1}/${cart.category2}/${cart.category3}/${cart.pname}/메인.jpg">
				</td>
				<td width="40%">
					<strong style="font-size:15pt;">${cart.pname}</strong> - ${cart.options}<br><br>
					상품 글 보러 가기 => <a href="../proboard/product.do?pbno=${cart.pbno}">${cart.title}</a>
				</td>
				<td width="20%">${cart.price} 원 / ${cart.count} 개</td>
				<td width="20%">
					합계 : <span id="price${cart.pno}">${cart.count * cart.price}</span> 원&nbsp;&nbsp;
					<input type="button" onclick="deleteCart('${cart.pname}','${cart.options}',${cart.pno})" value="삭제">
				</td>
				
			</tr>
		</c:forEach>
			<tr align="center">
				<td colspan="3" width="30%" style="font-size:17pt; font-weight:900;">주문금액 : <span id="selTotalPrice">0</span> 원&nbsp;&nbsp;ㅡ&nbsp;&nbsp;할인금액 : 0 원</td>
				<td colspan="2" width="70%" style="font-size:17pt; font-weight:900;">총 결제예정금액 : <span id="finalPrice">0</span> 원</td>
			</tr>
		</table>
	</div>
	<input type="button" onclick="selPayRequest()" value="선택상품주문">
	<input type="button" onclick="allPayRequest()" value="전체주문">
	
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>