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
	var todate;
	var fromdate;

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
	
	
	function searchDate(){
		//alert(todate+"~"+fromdate);
		location.href = "searchClaimDate.do?todate="+todate+"&fromdate="+fromdate;
	}
	


	$(function() {
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 

		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		}

		todate = year+"-"+month+"-"+day;
		fromdate = year+"-"+month+"-"+day;
	  $('input[name="daterange"]').daterangepicker({
		  showDropdowns: true,
		  endDate: moment().startOf('hour'),
		  maxDate: moment().startOf('hour'),
		  locale: {
		      format: 'YYYY-MM-DD'
		    }
	  }, function(start, end, label) {
	    todate = start.format('YYYY-MM-DD');
	    fromdate = end.format('YYYY-MM-DD');
	  });
	});
	
	
</script>

</head>

<body>
	<div class="row column">
	<div class="MPright_area">
		<div class="mypageSectorArea">
		    <h1 style="font-weight:900">마이페이지-취소/반품/교환 현황</h1>
		</div>
	
		<div class="h3WithAd">
			<h3 class="mgb10">
				<div class="txt">각 결제 건의 취소, 교환, 반품 현황을 확인할 수 있습니다.</div>
			</h3>
		</div>	
		<div class="row column end">
		<form name="OrderSearchListForm" method="get" action="refer.do">
			<div class="cmtbox">
				<table cellspacing="0" cellpadding="0" class="tb_checkingPeriod">
					<tr>
						<th class="item">조회기간</th>
						<td class="con">
							<div class="previousDetailsWrap">
								<input type="text" name="daterange" style="width:240px" value="" />							
							</div>
						</td>
						<td class="buttonWrap">
							<a href="#" class="periodButton" onclick="searchDate()"><em style="font-size:20pt">조회하기</em></a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
	</div>
	
	
	<div class="row column">			
			<div style="text-align: center">
				<ul class="tabs" data-tabs="" id="example-tabs" role="tablist" data-e="af0r5m-e">
					<li class="tabs-title is-active" role="presentation" >
					<a href="#panel1" aria-selected="true" role="tab" aria-controls="panel1" id="panel1-label" tabindex="0">결제건으로 보기</a></li>
					<li class="tabs-title" role="presentation">
					<a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label" tabindex="-1">상품별로 보기</a></li>
				</ul>
			</div>
			<div class="tabs-content" data-tabs-content="example-tabs">
				<div class="tabs-panel is-active" id="panel1" role="tabpanel"
					aria-labelledby="panel1-label">
					<div class="media-object stack-for-small">
						<div class="media-object-section" style="text-align: center;">
							<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
								<col width="76"><col width="80"><col width="80"><col width="80"><col width="60">
									<thead>
										<tr class="tb_myPgThB mgt15">
											<th style="text-align:center;">주문번호</th>
											<th style="text-align:center;">받는이</th>
											<th style="text-align:center;">상품명</th>
											<th style="text-align:center;">결제금액</th>
											<th style="text-align:center;">주문현황</th>
										</tr>
									</thead>
											
									<c:choose>
								    	<c:when test="${empty plist}">
								    		<tr>
											    <td class='tcon pdt9b6l5' height=30 colspan=5 align=center>대상건이 존재하지 않습니다.</td>
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
								          	</tr>
								          </c:forEach> 
								    	</c:otherwise>
							    	</c:choose>
							</table>	
						</div>
					</div>
				</div>
				<div class="tabs-panel" id="panel2" role="tabpanel"
					aria-labelledby="panel2-label" aria-hidden="true">
					
					<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
						<col width="40"><col width="80"><col width="20"><col width="30"><col width="30"><col width="40"><col width="40">
							<thead>
								<tr class="tb_myPgThB mgt15">
									<th colspan="2" style="text-align:center;">상품명</th>
									<th style="text-align:center;">수 량</th>
									<th style="text-align:center;">가 격</th>
									<th style="text-align:center;">합 계</th>
									<th style="text-align:center;">주문현황</th>
									<th style="text-align:center;">&nbsp;</th>
								</tr>
							</thead>
							
							
							<c:choose>
						    	<c:when test="${empty prlist}">
						    		<tr>
									    <td class='tcon pdt9b6l5' height=30 colspan=7 align=center>대상건이 존재하지 않습니다.</td>
									</tr>
						    	</c:when>
					    		<c:otherwise>   
					    		  <c:forEach var="pr" items="${prlist}">
						          	<tr class="prlist" style="text-align:center;">
						          		<td>
						          		<a href="../proboard/product.do?pbno=${pr.pbno}">
						          			<img src="${pageContext.request.contextPath}${pr.path}/메인.jpg" width="120"><br><br>
						          			상품 게시글 보기
						          		</a>
						          		</td>
						          		<td>${pr.pname}<br><strong>${pr.options}</strong></td>
						          		<td>${pr.count}</td>
						          		<td>${pr.price}</td>
						          		<td>${pr.count * pr.price}</td>
						          		<td>${pr.status}</td>
						          		<td><input type="button" onclick="" value="리뷰 남기기"></td>
						          	</tr>
						          </c:forEach> 
						    	</c:otherwise>
					    	</c:choose>
					</table>	
				</div>
			</div>
		</div>
	
	


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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>