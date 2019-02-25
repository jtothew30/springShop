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

<style type="text/css">
	
</style>

<script type="text/javascript">
	
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
		        <input type="radio" name="radioTxt" value="base" checked>기본 배송지	        
			</th>
			<th style="padding-top:18px">
				<input type="radio" name="radioTxt" value="type">직접입력
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
				    			<td colspan="2">현재 등록된 배송지 정보가 없습니다.</td>
				    		</tr>
				    	</c:when>
			    		<c:otherwise>   
				    		<tr>
								<td width="20%">받으시는 분</td>
								<td width="80%">${base.recipient}</td>
							</tr>
							<tr>
								<td width="20%">주소</td>
								<td width="80%">${base.addr1} ${base.addr2}</td>
							</tr>
							<tr>
								<td width="20%">연락처</td>
								<td width="80%">${base.phone}</td>
							</tr>
							<tr>
								<td width="20%">배송시 요구사항</td>
								<td width="80%">${base.memo}</td>
							</tr>
		    		    </c:otherwise>
	    		    </c:choose>
				
			</table>
			</td>
		</tr>
	</table>
	</div>
	
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
					    				<td><input type="radio" name="addrRadio" value="addr${addr.addrno}"></td>
					    				<td>${addr.addrname} <c:if test="${addr.base == 'true'}">(기본)</c:if> </td>
					    				<td>${addr.addr1} ${addr.addr2}</td>
					    				<td>${addr.recipient}</td>
					    				<td>${addr.phone}</td>
					    			</tr>
					    		</c:forEach>
			    		    </c:otherwise>
		    		    </c:choose>
	           		</tbody>
	           </table>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
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
</body>
</html>