<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송조회</title>
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
	var todate;
	var fromdate;

	function searchDate(){
		//alert(todate+"~"+fromdate);
		location.href = "myorder.do?todate="+todate+"&fromdate="+fromdate;
	}
	

	$(function() {
		tabs = "${tabs}";	
		
		if(tabs == null || tabs == ''){
			$("#li1").addClass('is-active');
			$("#panel1-label").attr('aria-selected','true');
			$("#panel1-label").attr('tabindex','0');
			
			$("#panel1").addClass('is-active');
			$("#panel1").removeAttr('aria-hidden');			
		}else if(tabs == 'payrequest'){
			$("#li1").removeClass('is-active');
			$("#panel1-label").attr('aria-selected','false');
			$("#panel1-label").attr('tabindex','-1');
			
			$("#li2").addClass('is-active');
			$("#panel2-label").attr('aria-selected','true');
			$("#panel2-label").attr('tabindex','0');
			
			$("#panel1").removeClass('is-active');
			$("#panel1").attr('aria-hidden','true');
			
			$("#panel2").addClass('is-active');
			$("#panel2").removeAttr('aria-hidden');
		}
		
		
		
		
		if( "${todate}" == "" ||  "${todate}" == null){
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
		}else{
			todate = "${todate}";
			fromdate = "${fromdate}";
			
			$('input[name="daterange"]').daterangepicker({
				  showDropdowns: true,
				  startDate : todate,
				  endDate: fromdate,
				  maxDate: moment().startOf('hour'),
				  locale: {
				      format: 'YYYY-MM-DD'
				    }
			  }, function(start, end, label) {
			    todate = start.format('YYYY-MM-DD');
			    fromdate = end.format('YYYY-MM-DD');
			  });
		}
	});
	
</script>

</head>

<body>
	<div class="row column">
	<div class="MPright_area">
		<div class="mypageSectorArea">
		    <h1 style="font-weight:900">마이페이지-주문/배송현황</h1>
		</div>
	
		<div class="h3WithAd">
			<h3 class="mgb10">
				<div class="txt">결제와 배송진행에 따라 배송지변경, 취소, 교환, 반품 신청이 가능합니다.</div>
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
						<td class="buttonWrap">
							<a href="myorder.do" class="periodButton"><em style="font-size:20pt">전체보기</em></a>
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
					<li class="tabs-title" id="li1" role="presentation" >
					<a href="#panel1" role="tab" aria-controls="panel1" aria-selected="false" id="panel1-label" tabindex="-1">결제건으로 보기</a></li>
					<li class="tabs-title" id="li2" role="presentation">
					<a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label" tabindex="-1">상품별로 보기</a></li>
				</ul>
			</div>
			<div class="tabs-content" data-tabs-content="example-tabs">
				<div class="tabs-panel" id="panel1" role="tabpanel"
					aria-labelledby="panel1-label" aria-hidden="true">
					
					<c:import url="/mypage/myorderPayment.do" />
												
				</div>
				<div class="tabs-panel" id="panel2" role="tabpanel"
					aria-labelledby="panel2-label" aria-hidden="true">
					
					<c:import url="/mypage/myorderPayrequest.do" />
					
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
