<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/반품/교환 현황</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myorder.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-stars.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.paylist:hover{
		cursor: pointer;
		background-color: #FFBBBB;
	}
	.prlist:hover{
		background-color: #FFBBBB;
	}
</style>


<script>
	var payment;
	
	function checkDetail(payno) {
		$.ajax({
			type: "POST",
			url: "getPayrequestList.do",
			data : {'payno' : payno},
			success : function(data){
				//alert(data.length);
				var obj = JSON.parse(data);
				var str= "";
				for(var i=0; i<obj.length; i++){
					str += "<tr align=\"center\">";
					str += "<td width=\"20%\"><img src=\"${pageContext.request.contextPath}/resources/upload/"+obj[i].pbno+"/"+obj[i].pname+"/메인.jpg\" width='150'></td>";   
					str += "<td width=\"40%\">";
					str += "<strong style=\"font-size:15pt;\">"+obj[i].pname+"<br></strong>-"+obj[i].options+"-<br><br>";
					str += "상품 글 보러 가기 => <a href=\"../proboard/product.do?pbno="+obj[i].pbno+"\">"+obj[i].title+"</a></td>";
					str += "<td width=\"20%\">"+obj[i].price+" 원 / "+obj[i].count+" 개</td>";
					str += "<td width=\"20%\">합계 : " + obj[i].count*obj[i].price +" 원</td></tr>";
				}
				$("#detailList").html(str);			
			}
		})
	}
	
</script>

</head>

<body>
	
	<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
		<col width="30"><col width="40"><col width="100"><col width="50"><col width="30"><col width="60">
			<thead>
				<tr class="tb_myPgThB mgt15">
					<th style="text-align:center;">주문번호</th>
					<th style="text-align:center;">받는이</th>
					<th style="text-align:center;">상품명</th>
					<th style="text-align:center;">결제금액</th>
					<th style="text-align:center;">주문현황</th>
					<th style="text-align:center;">주문날짜</th>
				</tr>
			</thead>
					
			<c:choose>
		    	<c:when test="${empty plist}">
		    		<tr>
					    <td class='tcon pdt9b6l5' height=30 colspan=6 align=center>대상건이 존재하지 않습니다.</td>
					</tr>
		    	</c:when>
	    		<c:otherwise>   
	    		  <c:forEach var="pay" items="${plist}">
		          	<tr class="paylist" align="center">
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.payno}</td>
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.recipient}</td>
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.payname}</td>
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.total}</td>
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.status}</td>
		          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.paydate}</td>
		          	</tr>
		          </c:forEach> 
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
	              <li><a class="pagination-pointed-button" href="myclaim.do?pagePy=${index}&tabs=payemnt&todate=${todate}&fromdate=${fromdate}" aria-label="Page ${index}">${index}</a></li>
	            </c:otherwise>
	          </c:choose>
	        </c:forEach>        
	        <li class="pagination-next disabled">Next
	            <span class="show-for-sr">page</span></li>
	      </ul>
	    <!-- pageing template -->	
						
						
<div class="modal fade" id="layerpop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">상품 목록</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	           <table>
	           		<thead>
	           			<tr>
							<th>&nbsp;</th> <th style="text-align:center;">상품</th> <th style="text-align:center;">가격/수량</th> <th style="text-align:center;">합 계</th>
						<tr>
	           		</thead>
	           		<tbody id="detailList"></tbody>			
	           </table>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>