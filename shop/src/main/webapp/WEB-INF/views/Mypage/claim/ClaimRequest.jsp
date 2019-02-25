<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/교환/반품현황</title>
<link rel="stylesheet" href="resources/css/mypage/reference.css">
</head>
<body>

<div class="MPright_area">

 <div class="mypageSectorArea">
    <h2 class="titleMypage">마이페이지</h2>
  </div>
			<h3 class="title mgt25">
				<div class="tit" ><img src="resources/image/claim.gif" alt="취소/반품/교환 신청" /></div>
			</h3>

			<div class="box_caution" style="margin-top: 0px;">
				<ul class="box_caution_list">
					<li class="cau_li clearfix">
						<strong class="tit" style="width:91px;">주문취소</strong>
						<span class="descript">
							판매자에게 주문통보 전에는 즉시취소가 가능하며, 주문통보 후에는 취소요청 후 판매자 승인이 되어야 환불이 이루어집니다.
						</span>
					</li>
					<!-- 110902수정 Start -->
					<li class="cau_li clearfix">
						<strong class="tit" style="width:91px;">반품/교환</strong>
						<span class="descript">
							배송완료 후 7일 이내에만 반품/교환이 가능하며, 오픈마켓 상품의 경우 구매확정 이후에는 반품/교환 접수가 불가능 합니다.<br>
							판매되는 상품의 책임은 모두 판매자에게 있으므로 판매자와  협의 후 , 반품/교환 신청 하시기 바랍니다. <br>
							판매자와 협의가 원만하게 이루어 지지 않거나,  판매자와 장기간 연락이 이루어지지 않는 경우는<br>
							당사 고객센터로 문의해 주시기 바랍니다.<br>
							고객님의 책임으로 상품등이 멸실 또는 훼손되었거나 특정 상품의 경우 포장을 개봉하였거나<br>
							포장을 훼손되어 상품 가치가 상실된 경우 반품/교환이 불가능할 수 있습니다.<br>
						</span>
					</li>
					<br>
					<li class="none clearfix">
						<strong class="tit">* 직거래로 인한 피해 발행시 ***는 법적인 책임을 지지 않으니 주의하시기 바랍니다.</strong>
					</li>
				</ul>
			</div>


			<div class="tab_apply_complain">
				<ul class="tab clearfix">
					<li class="tab_01on"><a href="#"><strong class="none">취소/반품/교환신청</strong></a></li>
					<li><a href="#"><strong class="none">취소현황</strong></a></li>
					<li><a href="#"><strong class="none">반품/교환현황</strong></a></li>
				</ul>
			</div><!--//tab_apply_complain-->
			<!-- 취소/반품/교환 신청 E -->

			<!-- 주문 배송 리스트 S -->
			<form name="radioForm" method="post">
			<table cellspacing="0" cellpadding="0" width="785" class="tb_myPgThA mgt15">
				<col width="30"><col width="77"><col><col width="80"><col width="40"><col width="80"><col width="80"><col width="60">
				<tr>
					<th>선택</th>
					<th>주문번호</th>
					<th>상품명</th>
					<th>판매단가</th>
					<th>수량</th>
					<th>소계금액</th>
					<th>주문현황</th>
					<th class="last">판매자</th>
				</tr>
			</table>


			<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
				<col width="30"><col width="77"><col><col width="80"><col width="40"><col width="80"><col width="80"><col width="60">
				<input type="hidden" name="totalSize" value="0">
				<tr>
					<td class="tcon pdt5b5" align="center" colspan="8">
						신청가능한 주문내역이 없습니다.
					</td>
				</tr>
			</table>
			</form>

			<div class="div_btnArea mgt15">

			<div class="btm_step" id="step_cancel1" style="display:none; margin: 0 0 0 0; padding: 0px;"><!-- 즉시취소 일때 이미지 -->
				<img src="https://sslimage.interpark.com/_mypage_n/step_cancel_01n.gif">
			</div>

			</div>

			<div  name="rtn1" id="rtn1" style="display: none">
					<div class="box_qbox_top"></div>
					<div class="box_qbox_mid">

						<div id="step_return1" class="btm_step2_new" style="display: block; padding: 0px;">
							<img src="https://sslimage.interpark.com/_mypage_n/step_return_01m.gif">

							<p>※ 판매되는 상품의 책임은 모두 판매자에게 있으므로 사전에 반품/교환 여부를 판매자와 협의 하시고, 신청하시기 바랍니다. </p>
						</div>
					</div>
					<div class="box_qbox_bot"></div>
			</div>

			<div class="div_btnArea mgt15">
			<div  name="but1" id="but1" style="display:none">
				<a href="javascript:goCancelReq();"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_cancel02.gif"  alt="취소신청" /></a>
			</div>
			<div  name="but2" id="but2" style="display:none">
				<a href="javascript:goRtnExchClaim('rtn');"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_returning02.gif"  alt="반품신청" /></a>
				<a href="javascript:goRtnExchClaim('exch');"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_recall02.gif"  alt="교환신청" /></a>
			</div>
			<div  name="but3" id="but3" style="display:none">
				<a href="javascript:goRtnExchClaim('rtn');"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_returning02.gif"  alt="반품신청" /></a>
				<a href="javascript:goRtnExchClaim('exch');"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_recall02.gif"  alt="교환신청" /></a>
			</div>
			<div  name="buttonReturn" id="buttonReturn" style="display:none">
				<a href="javascript:goRtnExchClaim('rtn');"><img src="https://sslimage.interpark.com/_mypage_n/btn/bt_apply_returning02.gif"  alt="반품신청" /></a>
			</div>
			</div>
			<div id='rtn_exch_req' class="div_btnArea mgt15"></div>
		</div>
	</div>
</div>



</body>
</html>