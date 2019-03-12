<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>cart page</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	var cartlist;	// all my cart list
	var sellist;	// selected production list for payment
	var oplist;     // options list from change menu modal
	var lastpro;
	
	$(function(){
		cartlist = new Array();
		<c:forEach var="cart" items="${cartlist}">
			var json = new Object();
			json.pno = "${cart.pno}";
			json.pbno = "${cart.pbno}";
			json.customer = "${cart.customer}";
			json.pname = "${cart.pname}";
			json.options = "${cart.options}";
			json.count = "${cart.count}";
			json.price = "${cart.price}"; 
			json.category1 = "${cart.category1}"; 
			json.category2 = "${cart.category2}";
			json.category3 = "${cart.category3}";
			json.title = "${cart.title}";
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
						url: "../payment/checkPayment.do",
						success : function(data){
							if(data == true){
								$.ajax({
									type: "POST",
									url: "../payment/payrequest.do",
									data : {'list' : JSON.stringify(sellist), 'del' : 'false'},
									success : function(){
										swal("결제 페이지로 이동합니다.")
										.then((value) => {
											location.href="../payment/paymentPage.do";
										});
									}
								})	
							}else{
								swal("이미 진행 중인 결제건이 있습니다!","","warning",  {
									buttons: {				    
									    catch: {
									      text: "기존 결제건 확인.",
									      value: "catch",
									    },
									    defeat:{
									    	text: "기존 건 삭제 후 진행.",
									    	value: "defeat",
									    },
									    cancel: "취소",
									  },
									})
									.then((value) => {
									  switch (value) {					 
									    case "catch":
									    	location.href="../payment/paymentPage.do";		    	
									      break;	
									    case "defeat":
									    	$.ajax({
												type: "POST",
												url: "../payment/payrequest.do",
												data : {'list' : JSON.stringify(sellist), 'del' : 'true'},
												success : function(){
													swal("결제페이지로 이동합니다.","", "success")
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
	
	
	function optionChange(pno) {
		var pro;
		for(var i=0; i<cartlist.length; i++){
			if(cartlist[i].pno == pno){
				pro = cartlist[i];
				lastpro = cartlist[i];
				break;
			}
		}
		
		$("#opchg_img").html("<img src=\"${pageContext.request.contextPath}/resources/upload/"+pro.pbno+"/"+pro.pname+"/메인.jpg\" width=\"130\">");
		$("#opchg_title").html("<a href=\"../proboard/product.do?pbno="+pro.pbno+"\">"+pro.title+"</a>")
		$("#opchg_pname").html(pro.pname);
		$("#opchg_option").html(pro.options);
		$("#opchg_count").val(pro.count);
		$("#opchg_price").html(pro.price);
		$("#opchg_total").html(pro.count*pro.price); 
		//$("#opchg_originalop").html(pro.options);
		
		
		oplist = new Array();
		var str = "<option selected>변경 옵션 선택</option>";
		$.ajax({
			type: "POST",
			url: "getOptions.do",
			data : {'pbno' : pro.pbno},
			success : function(data){
				var prolist = JSON.parse(data);
				//alert(prolist.length);
				for(var i=0; i<prolist.length; i++){
					//if(prolist[i].pno != pro.pno){
						console.log("prolist[i].pno : " + prolist[i].pno +"/ pro.pno : " + pro.pno);
						oplist.push(prolist[i]);
						str += "<option value=\""+prolist[i].options+"\">"+prolist[i].options+"-재고:"+prolist[i].count+"</option>";
					//}						
				}
				//alert(str);
				$("#selectOption").html(str);
			}
		})
	}
	
	
	function selectOption() {
		var sel = document.getElementById("selectOption");
		var op = sel.options[sel.selectedIndex].value;
		var count = $("#opchg_count").val();
		var pro = new Object();		
		
		for(var i=0; i<oplist.length; i++){
			if(oplist[i].options == op){
				console.log("oplist[i].options : "+oplist[i].options+" / option : "+op);
				pro = oplist[i];
				break;
			}
		}
		
		if(pro.count < count){
			swal("옵션 '"+pro.options+"'의 재고를 넘어선 요청입니다.");
			$("#opchg_count").val(pro.count);
			return;
		}
		
		console.log("option:"+op+"/price:"+pro.outprice+"/count:"+count);
		$("#opchg_price").html(pro.outprice);
		$("#opchg_total").html(count*pro.outprice);	
	}
	
	function changeOption() {
		var sel = document.getElementById("selectOption");
		var op = sel.options[sel.selectedIndex].value;
		
		if(op == '변경 옵션 선택'){
			swal("옵션을 선택해주세요!", "변경처리가 제대로 되지 않았습니다.", "warning");
			return;
		}
		
		var count = $("#opchg_count").val();
		var pro = new Object();		
		
		for(var i=0; i<oplist.length; i++){
			if(oplist[i].options == op){
				console.log("oplist[i].options : "+oplist[i].options+" / option : "+op);
				pro = oplist[i];
				break;
			}
		}
		
		var eq = false;
		if(pro.options == lastpro.options){
			eq = true;
		}
			
		 $.ajax({
			type: "POST",
			url: "changeOption.do",
			data : {'lastpno' : lastpro.pno, 'pno' : pro.pno, 'price' : pro.outprice, 'count' : count, 'eq' : eq},
			success : function(data){				
				if(data == true){
					swal("옵션이 변경되었습니다.", "", "success")
					.then((value) => {
						location.reload();
					});
				}else{
					swal("이미 장바구니에 있는 옵션을 선택하셨습니다!", "변경처리가 제대로 되지 않았습니다.", "warning");
				}		
			}
		}) 
		
	}
	
</script>
</head>
<body>

<c:import url="../header.jsp" />
	<div style="margin: 0% 10%;">
	<div class="chkclass">
		<table>	
			<thead>
			<tr>
				<th>&nbsp;</th> <th>&nbsp;</th> <th style="text-align:center;">장바구니 상품</th> <th style="text-align:center;">가격/수량</th> <th style="text-align:center;">합 계</th>
			</tr>
			</thead>

			<c:choose>
		    	<c:when test="${empty cartlist}">
		    		<tr>
					    <td class='tcon pdt9b6l5' height=30 colspan=5 align=center>대상건이 존재하지 않습니다.</td>
					</tr>
		    	</c:when>
	    		<c:otherwise>
		    		<c:forEach var="cart" items="${cartlist}">
					<tr align="center">
						<td width="3%">
							<input type="checkbox" class="chk" onclick="chkChange()" value="${cart.pno}">
						</td>
						<td width="17%">
							<img src="${pageContext.request.contextPath}/resources/upload/${cart.pbno}/${cart.pname}/메인.jpg">
						</td>
						<td width="40%">
							<strong style="font-size:15pt;">${cart.pname}</strong> - ${cart.options}<br><br>
							상품 글 보러 가기 => <a href="../proboard/product.do?pbno=${cart.pbno}">${cart.title}</a>
						</td>
						<td width="20%">
							${cart.price} 원 / ${cart.count} 개<br>
							<button type="button" class="hollow button" data-target="#layerpop" data-toggle="modal" onclick="optionChange(${cart.pno})">변경</button> 
						</td>
						<td width="20%">
							합계 : <span id="price${cart.pno}">${cart.count * cart.price}</span> 원&nbsp;&nbsp;
							<input type="button" class="hollow button alert" onclick="deleteCart('${cart.pname}','${cart.options}',${cart.pno})" value="삭제">
						</td>				
					</tr>
					</c:forEach>
					<tr align="center">
						<td colspan="3" width="30%" style="font-size:17pt; font-weight:900;">주문금액 : <span id="selTotalPrice">0</span> 원&nbsp;&nbsp;ㅡ&nbsp;&nbsp;할인금액 : 0 원</td>
						<td colspan="2" width="70%" style="font-size:17pt; font-weight:900;">총 결제예정금액 : <span id="finalPrice">0</span> 원</td>
					</tr>
	    		</c:otherwise>
    		</c:choose>	
		</table>
		<!-- pageing template -->
	      <ul class="pagination-pointed pagination text-center" role="navigation" aria-label="Pagination">        
	        <li class="pagination-previous disabled">Previous
				<span class="show-for-sr">page</span></li>
	        <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	          <c:choose>
	            <c:when test="${paging.page==index}">
	              <li class="current"><span class="show-for-sr">You're on page</span> ${index}</li>
	            </c:when>
	            <c:otherwise>
	              <li><a class="pagination-pointed-button" id="paging-focus" href="cart.do?page=${index}" aria-label="Page ${index}">${index}</a></li>
	            </c:otherwise>
	          </c:choose>
	        </c:forEach>        
	        <li class="pagination-next disabled">Next
	            <span class="show-for-sr">page</span></li>
	      </ul>
	    <!-- pageing template -->
	</div>
	<input type="button" class="button primary" onclick="selPayRequest()" value="선택상품주문">
	<input type="button" class="button secondary" onclick="allPayRequest()" value="전체주문">
	
	
	
	
	
	
	
	
	
	
	
	<div class="modal fade" id="layerpop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">상품 변경 메뉴</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">	      		
	      		현재 옵션 : <strong id="opchg_option"></strong><hr>
                 <select id="selectOption" onchange="selectOption()" style="width:300pt; display: inline;"></select>
	              - 개수 <input type="number" id="opchg_count" min="1" onInput="selectOption()" style="width:40pt; display: inline;"><hr> 
	           
	           <table>
	           		<thead>
	           		<tr>
	           			<th colspan="2" style="text-align:center;">상품정보</th>
	           			<th style="text-align:center;">판매가</th>
	           		</tr>
	           		</thead>
	           		<tr style="text-align:center;">
	           			<td>
	           				<span id="opchg_img"></span>
	           			</td>
	           			<td>	
	           				<strong><span id="opchg_title"></span><br>상품 : <span id="opchg_pname"></span></strong>
	           			</td>
	           			<td id="opchg_price"></td>
	           		</tr>
	           </table><hr>	           
	                                       
	           <p>
	           	<strong style="font-size:25pt">총합계금액(수량) : <span id="opchg_total"></span>원</strong>
	           </p>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="hollow button success" data-dismiss="modal" onclick="changeOption()">변경 완료</button>
	        <button type="button" class="hollow button alert" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
	
	
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<c:import url="../footer.jsp" />
</body>
</html>
