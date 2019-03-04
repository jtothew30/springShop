<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>payment page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	var flag;
	
	function changeSelectAddr() {
		var radio = document.getElementsByName("seladdr");
		var sel;
		for(var i=0; i<radio.length; i++){
			if(radio[i].checked){
				sel = radio[i];
				break;
			}
		}
		//alert(sel.value);
		if(sel.value == 'base'){
			var list = new Array();
			list = "${addrlist}";
			//alert("check : "+list.length + "/"+list);
			if(list.length==2){
				$("#recipient").html("현재 등록된 배송지 정보가 없습니다.");
				$("#addr").html("");
				$("#phone").html("");
				$("#memo").html("<input type='text' id='newmemo'>");				
			}else{				
				$("#recipient").html("${base.recipient}");
				$("#addr").html("<span id='addr1'>${base.addr1}</span><br><span id='addr2'>${base.addr2}</span>");
				$("#phone").html("${base.phone}");
				$("#memo").html("<input type='text' id='newmemo'>");
			}
		}else{
			$("#recipient").html("<input type='text' id='newrecipient' required>");
			$("#phone").html("<input type='text' id='newphone' placeholder='xxx-xxxx-xxxx' required>");
			$("#memo").html("<input type='text' id='newmemo'>");
			
			var str = "";
			str += "<input type='button' onclick=\"execPostCode();\" value='우편번호 찾기'>"
			str += "<br><br><div class='form-group'><input class='form-control' style='top: 5px;' placeholder='도로명 주소' name='addr1' id='addr1' type='text' readonly='readonly' /></div>";   
			str += "<div class='form-group'><input class='form-control' placeholder='상세주소' name='addr2' id='addr2' type='text' required /></div>";
				
			$("#addr").html(str);
		}
	}
	
	
	function selAddr(){
		var radio = document.getElementsByName("addrRadio");
		var sel;
		for(var i=0; i<radio.length; i++){
			if(radio[i].checked){
				sel = radio[i];
				break;
			}
		}
				
		var recipient = $("#selRecipient"+sel.value).html();
		var addr1 = $("#selAddr1"+sel.value).html();
		var addr2 = $("#selAddr2"+sel.value).html();
		var phone = $("#selPhone"+sel.value).html();
		
		//alert(sel.value+"/"+recipient+"/"+addr1+"/"+addr2+"/"+phone);
		
		radio = document.getElementsByName("seladdr");
		for(var i=0; i<radio.length; i++){
			if(radio[i].value == 'type'){
				radio[i].checked = true;
				changeSelectAddr();
			}else
				radio[i].checked = false;
		}
		
		document.getElementById("newrecipient").value = recipient;
		document.getElementById("addr1").value = addr1;
		document.getElementById("addr2").value = addr2;
		document.getElementById("newphone").value = phone;
	}
	
	
	
	
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=addr1]").val("("+data.zonecode+")" + fullRoadAddr);             
               
           }
        }).open();
    }

	
	
	function pay() {
		var totalprice = $("#finalPrice").html();
		var recipient = "";
		var addr1addr1 = "";
		var addr2 = "";
		var phone = "";
		var memo = $("#newmemo").val();
		var name = "";
		var count = 0;
		var payno = 0;
		
		var radio = document.getElementsByName("seladdr");
		var sel;
		for(var i=0; i<radio.length; i++){
			if(radio[i].checked){
				sel = radio[i];
				break;
			}
		}
		if(sel.value == 'base'){			
			recipient = $("#recipient").html();
			addr1 = $("#addr1").html();
			addr2 = $("#addr2").html();
			phone = $("#phone").html();
		}else{
			recipient = $("#newrecipient").val();
			addr1 = $("#addr1").val();
			addr2 = $("#addr2").val();
			phone = $("#newphone").html();			
		}
		
		//alert("total:"+totalprice+"//recipient:"+recipient+"//addr:"+addr1+"-"+addr2+"//phone:"+phone+"//memo:"+memo);
		
		var list = Array();		// for controller
		var itemlist = Array(); // for bootpay request
		<c:forEach var="preq" items="${preqlist}">
			var json1 = new Object();
			json1.pno = "${preq.pno}";
			json1.pbno = "${preq.pbno}";
			json1.options = "${preq.options}";
			json1.count = "${preq.count}";
			json1.pname = "${preq.pname}";
			list.push(json1);			
			count += json1.count*1;
			
			var json2 = new Object();
			json2.item_name = "${preq.options}";
			json2.qty = "${preq.count}";
			json2.unique = "${preq.reqno}";
			json2.price = "${preq.price}";
			json2.cat1 = "${preq.category1}";
			json2.cat2 = "${preq.category2}";
			json2.cat3 = "${preq.category3}";
			itemlist.push(json2);		
			
			payno = "${preq.payno}";
		</c:forEach>
		
		
		name = list[0].pname+"-"+list[0].options;
		if(list.length >= 2)
			name += (" 및 "+(list.length-1)+"개");
		
		BootPay.request({
			price: 1000, //실제 결제되는 가격 totalprice
			application_id: "5c6661f2396fa61dea25a794",
			name: name, //결제창에서 보여질 이름
			pg: 'danal',
			 //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: itemlist, /* [
				{
					item_name: name, //상품명
					qty: count, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
				}
			], */
			user_info: {
				username: "${customer}",
				email: "${email}",
				addr: addr1+" "+addr2,
				phone: phone
			},
			order_id: payno, //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {recipient: recipient, address1: addr1, address2: addr2, memo: memo},
			account_expire_at: '2019-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
				end_at: '2021-10-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			
			/* var suc = function () {
				transactionConfirm();
			}
			var fai = function () {
				removePaymentWindow();
			}
 */
			// 재고 수량 관리 로직 혹은 다른 처리
			$.ajax({
				type: "POST",
				context: this,
				url: "checkStock.do",
				success : function(f){
					if(f=="true"){
						this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
					}else{							
						$.ajax({	//진행 중이던 결제 정보 삭제 이후 장바구니로 이동
							type: "POST",
							context: this,
							url: "deletePayment.do",
							success : function(data){
								swal("현재 요청한 상품의 재고가 부족한 상황입니다!","장바구니로 이동합니다.", "warning")
								.then((value) => {
								  location.href="../cart/cart.do";
								});
								this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
							}
						})	
					}
				}
			})	
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
			
			payment={
					payno: data.order_id,
					recipient: data.params.recipient,
					payname: data.item_name,
					address1: data.params.address1,
					address2: data.params.address2,
					memo: data.params.memo,
					total: data.amount
				};
					
			$.ajax({
				type: "POST",
				url: "payment.do",
				data : {'payment' : JSON.stringify(payment)},
				success : function(data){
					swal("결제가 완료되었습니다!","결제 확인 페이지로 이동합니다.", "success")
					.then((value) => {
					  location.href="paymentResult.do?payno="+data;
					});
				}
			})		
		});
	}
	
	
	function cancel() {
		swal("결제 진행을 취소하시겠습니까?", "", "warning", {
			  buttons: {				    
			    catch: {
			      text: "예",
			      value: "catch",
			    },
			    cancel: "아니오",
			  },
			})
			.then((value) => {
			  switch (value) {					 
			    case "catch":
			    	$.ajax({
						type: "POST",
						url: "deletePayment.do",
						success : function(){
							swal("결제가 취소되었습니다.","장바구니 페이지로 이동합니다.", "success")
							.then((value) => {
							  location.href="../cart/cart.do";
							});
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
	
	&#60;결제 요청 정보&#62;
	<table>	
		<thead>
			<tr>
				<th>&nbsp;</th> <th style="text-align:center;">결제 요청 상품</th> <th style="text-align:center;">가격/수량</th> <th style="text-align:center;">합 계</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="preq" items="${preqlist}">
			<tr align="center">
				<td width="20%">
					<img src="${pageContext.request.contextPath}/resources/upload/${preq.category1}/${preq.category2}/${preq.category3}/${preq.pname}/메인.jpg">
				</td>
				<td width="40%">
					<strong style="font-size:15pt;">${preq.pname}</strong> - ${preq.options}<br><br>
					상품 글 보러 가기 => <a href="../proboard/product.do?pbno=${preq.pbno}">${preq.title}</a>
				</td>
				<td width="20%">${preq.price} 원 / ${preq.count} 개</td>
				<td width="20%">
					합계 : <span id="price${preq.pno}">${preq.count * preq.price}</span> 원
				</td>	
			</tr>
		</c:forEach>
		</tbody>
		<tr align="center">
			<td colspan="2" width="30%" style="font-size:17pt; font-weight:900;">주문금액 : <span id="reqTotalPrice">${total}</span> 원&nbsp;&nbsp;ㅡ&nbsp;&nbsp;할인금액 : 0 원</td>
			<td colspan="2" width="70%" style="font-size:17pt; font-weight:900;">총 결제예정금액 : <span id="finalPrice">${total}</span> 원</td>
		</tr>
	</table>
	
	<br><br><br>
	
	<div>	
	&#60;배송지 정보 입력&#62;
	<table>
		<tr align="center">
			<th>배송지 선택</th>
			<th style="padding-top:18px">
		        <input type="radio" name="seladdr" value="base" onclick="changeSelectAddr()" checked>기본 배송지	        
			</th>
			<th style="padding-top:18px">
				<input type="radio" name="seladdr" value="type" onclick="changeSelectAddr()">직접입력
			</th>
			<th>
				<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">배달지목록확인</button><br/>
					
			</th>
		</tr>
		<tr>
			<td colspan="4">
				<table>
					<tr>
						<td width="20%">주문자</td>
						<td width="80%">${customer}</td>
					</tr>
					
					<c:choose>
				    	<c:when test="${empty addrlist}">
				    		<tr>
								<td width="20%">받으시는 분</td>
								<td width="80%" id="recipient">현재 등록된 배송지 정보가 없습니다.</td>
							</tr>
							<tr>
								<td width="20%">주소</td>
								<td width="80%" id="addr"></td>
							</tr>
							<tr>
								<td width="20%">연락처</td>
								<td width="80%" id="phone"></td>
							</tr>
							<tr>
								<td width="20%">배송시 요구사항</td>
								<td width="80%" id="memo"><input type="text" id="newmemo"></td>
							</tr>
				    	</c:when>
			    		<c:otherwise>		    			
				    		<tr>
								<td width="20%">받으시는 분</td>
								<td width="80%" id="recipient">${base.recipient}</td>
							</tr>
							<tr>
								<td width="20%">주소</td>
								<td width="80%" id="addr"><span id="addr1">${base.addr1}</span><br><span id="addr2">${base.addr2}</span></td>
							</tr>
							<tr>
								<td width="20%">연락처</td>
								<td width="80%" id="phone">${base.phone}</td>
							</tr>
							<tr>
								<td width="20%">배송시 요구사항</td>
								<td width="80%" id="memo"><input type="text" id="newmemo"></td>
							</tr>					
			   		    </c:otherwise>
		  		    </c:choose>			    		    
				</table>		
			</td>
		</tr>
	</table>
	</div>
	
	<br><br><br>
	<input type="button" onclick="pay()" value="결제하기"> 
	<input type="button" onclick="cancel()" value="취소"> 
	<br><br><br>
	
	
	<div class="modal fade" id="layerpop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">나의 배송지</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	           <table>
	           		<thead>
	           			<tr>
	           				<th>선택</th> <th>배송지 이름</th> <th>주 소</th> <th>받는 사람</th> <th>연락처</th>
	           			</tr>
	           		</thead>
	           		<tbody>
	           			<c:choose>
					    	<c:when test="${empty addrlist}">
					    		<tr>
					    			<td colspan="5">현재 등록된 배송지 정보가 없습니다.</td>
					    		</tr>
					    	</c:when>
				    		<c:otherwise>   
					    		<c:forEach var="addr" items="${addrlist}">
					    			<tr>
					    				<td><input type="radio" name="addrRadio" value="${addr.addrno}"></td>
					    				<td><span id="selName${addr.addrno}">${addr.addrname}</span> <c:if test="${addr.base == 'true'}">(기본)</c:if> </td>
					    				<td><span id="selAddr1${addr.addrno}">${addr.addr1}</span> <span id="selAddr2${addr.addrno}">${addr.addr2}</span></td>
					    				<td><span id="selRecipient${addr.addrno}">${addr.recipient}</span></td>
					    				<td><span id="selPhone${addr.addrno}">${addr.phone}</span></td>
					    			</tr>
					    		</c:forEach>
			    		    </c:otherwise>
		    		    </c:choose>
	           		</tbody>
	           </table>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="selAddr()">선택완료</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
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
</html>



