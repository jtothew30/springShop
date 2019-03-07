<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품리뷰</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myorder.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.paylist:hover{
		cursor: pointer;
		background-color: #FFBBBB;
	}

</style>

<script>
	
</script>

</head>

<body>

	<div class="MPright_area">
		<div class="mypageSectorArea">
		    <h1 style="font-weight:900">마이페이지-내 상품 리뷰</h1>
		</div>
	
		<div class="h3WithAd">
			<h3 class="mgb10">
				<div class="txt">결제와 배송진행에 따라 배송지변경, 취소, 교환, 반품 신청이 가능합니다.</div>
			</h3>
		</div>
	
			<form name="OrderSearchListForm" method="get" action="refer.do">
				<div class="cmtbox">
					<table cellspacing="0" cellpadding="0" class="tb_checkingPeriod">
						<tr>
							<th class="item">조회기간</th>
							<td class="con">
								<div class="previousDetailsWrap">
									<input type="text" name="daterange" style="width:160px" value="" />							
								</div>
							</td>
							<td class="buttonWrap">
								<a href="#" class="periodButton" onclick="searchDate()"><em style="font-size:20pt">조회하기</em></a>
							</td>
						</tr>
					</table>
				</div>
				<div class="cmtbox_bot"></div>
			</form>
	</div>
	

<table cellspacing="0" cellpadding="0" width="785" class="tb_myPgThB mgt15">
	<col width="76"><col width="80"><col width="80"><col width="80"><col width="60"><col width="40">
	<tr>
		<th>주문번호</th>
		<th>받는이</th>
		<th>상품명</th>
		<th>결제금액</th>
		<th>주문현황</th>
		<th>&nbsp;</th>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
	<col width="76"><col width="80"><col width="80"><col width="80"><col width="60"><col width="40">
		<c:choose>
	    	<c:when test="${empty plist}">
	    		<tr>
				    <td class='tcon pdt9b6l5' height=30 colspan=8 align=center>대상건이 존재하지 않습니다.</td>
				</tr>
	    	</c:when>
    		<c:otherwise>   
    		  <c:forEach var="pay" items="${plist}">
	          	<tr class="paylist">
	          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.payno}</td>
	          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.recipient}</td>
	          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.payname}</td>
	          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.total}</td>
	          		<td onclick="checkDetail(${pay.payno})" data-target="#layerpop" data-toggle="modal">${pay.status}</td>
	          		<td><input type="button" onclick="cancelReq(${pay.payno})" value="취소신청"></td>
	          	</tr>
	          </c:forEach> 
	    	</c:otherwise>
    	</c:choose>
</table>

<div class="modal fade" id="layerpop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">결제 상품 목록</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	           <table>
	           		<thead>
	           			<tr>
							<th>&nbsp;</th> <th style="text-align:center;">결제 상품</th> <th style="text-align:center;">가격/수량</th> <th style="text-align:center;">합 계</th>
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>