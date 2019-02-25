<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link rel="stylesheet" href="resources/css/mypage/reference.css">
</head>
<body>

<div class="MPright_area">
	
	<div class="mypageSectorArea">
    	<h2 class="titleMypage">마이페이지</h2>
	</div>

	<h3 class="mgb10">
		<div class="tit" ><img src="resources/image/buylist.gif" alt="주문내역 " /></div>
		<div class="txt">현재 구매완료된내역입니다.</div>
	</h3>
	        
<!--------------------------------  2010 마이페이지 쇼핑내역/구매현황 END -------------------------------->
												
			<!-- 주문 배송 리스트 S -->
			<table cellspacing="0" cellpadding="0" width="785" class="tb_myPgThB">
    			<form name="OrderListForm" method="post">	
                    <input type="hidden" id="choice" name="choice" value="">
                    <input type="hidden" name="_method" value="">
                    <input type="hidden" name="ordNo" value="">
                    <input type="hidden" name="ordPwd">	
				<col width="70"><col width=""><col width="150"><col width="50">
				<tr>
					<th>구매번호</th>
					<th>상품명</th>
					<th>판매단가</th>
					<th>수량</th>
				</tr>
				
			<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
				<col width="30"><col width="76"><col width=""><col width="80"><col width="40"><col width="80"><col width="60"><col width="85">
				<tr>
				    <td class='tcon' height=30 colspan=10 align=center>대상건이 존재하지 않습니다.</td>
				</tr>
			</table>
                </form>
			</table>
 
			<h4 class="mgt20"><img src="resources/image/orderhelp.gif" alt="주문처리 현황 도우미" /></h4>
			<img src="resources/image/deli02.gif" alt="" />
</div>


</body>
</html>