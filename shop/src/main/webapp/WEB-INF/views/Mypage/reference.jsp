<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송조회</title>
<link rel="stylesheet" href="resources/css/mypage/reference.css">
</head>

<body>

<div class="MPright_area">
<div class="mypageSectorArea">
    <h2 class="titleMypage">마이페이지</h2>
</div>

<div class="h3WithAd">
	<h3 class="mgb10">
		<div class="tit" ><img src="resources/image/refer.gif" alt="주문현황" /></div>
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
								<div class="yearSelectWrap">
									<select id="selYearStart" class="txtbox">
										<option>2018</option><option>2019</option>
									</select>
								</div>
								<div class="selectTextWrap">
									년
								</div>
								<div class="monthSelectWrap">
									<select id="selMonthStart" class="txtbox">
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
									</select>
								</div>
								<div class="selectTextWrap">
									월
								</div>
								<div class="dateSelectWrap">
									<select id="selDayStart" class="txtbox">
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
									</select>
								</div>
								<div class="selectTextWrap">
									일
								</div>
								<div class="periodTextWrap">
									~
								</div>
								<div class="yearSelectWrap">
									<select id="selYearEnd" class="txtbox">
										<option>2018</option><option>2019</option>
									</select>
								</div>
								<div class="selectTextWrap">
									년
								</div>
								<div class="monthSelectWrap">
									<select id="selMonthEnd" class="txtbox">
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
									</select>
								</div>
								<div class="selectTextWrap">
									월
								</div>
								<div class="dateSelectWrap">
									<select id="selDayEnd" class="txtbox">
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
									</select>
								</div>
								<div class="selectTextWrap">
									일
								</div>
							</div>
						</td>
						<td class="buttonWrap">
							<a href="#" class="periodButton" onClick="goSearchButton();return false;"><em>조회하기</em></a>
						</td>
					</tr>
				</table>
			</div>
			<div class="cmtbox_bot"></div>
		</form>

<table cellspacing="0" cellpadding="0" width="785" class="tb_myPgThB mgt15">
	<col width="76"><col width=""><col width="80"><col width="40"><col width="80"><col width="80"><col width="85"><col width="60">
	<tr>
		<th>주문번호</th>
		<th>상품명</th>
		<th>판매단가</th>
		<th>수량</th>
		<th>소계금액</th>
		<th>주문현황</th>
		<th>배송/구매확정</th>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
	<col width="76"><col width=""><col width="80"><col width="40"><col width="80"><col width="80"><col width="85"><col width="60">
<tr>
    <td class='tcon pdt9b6l5' height=30 colspan=8 align=center>대상건이 존재하지 않습니다.</td>
</tr>
</table>

<div class="step_shopping"><img src="http://openimage.interpark.com/_mypage_n/img_step_shopping.gif" alt="" /></div>

</body>
</html>