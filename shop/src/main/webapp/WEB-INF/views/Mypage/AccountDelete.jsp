<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/snb.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/openid.css">
</head>

<body>

<div id="openIdWrap" align="center">
			<div class="interparkLogo" align="center">
				<img src="${pageContext.request.contextPath}/resources/image/logo.JPG">
			</div>
			<div class="contentsWrap">
				<form name="MemberInfoWithdrawalGuide" method="post" autocomplete="off">
					<div class="subConWrap">
						<h2 class="mainTitle">회원탈퇴</h2>
						<div class="outStepWrap">
						<ul>
							<li class="current">
							<span>1 탈퇴안내</span>
							</li>
							<li>
							<span>2 탈퇴사유</span>
							</li>
							<li>
							<span>3 탈퇴완료</span>
							</li>
						</ul>
						</div>
						<div class="withdrawWrap step1">
						<div class="memTopBox">
							<p>KGB 서비스를 이용하시는데
							<br>불편함이 있으셨나요?</p>
							<span class="caution">개인정보 및 메일 수신에 대해 불편을 느끼셨다면,
							<br>아래의 방법을 통해 회원님의 불편을 해결 하실 수 있습니다.</span>
						</div>
						<div class="outLinkBox">
							<ul>
							<li>
								<a>
								<span class="btnCommonWhite">회원정보수정</span>
								</a>
								<a>
								<span class="btnCommonWhite">비밀번호변경</span>
								</a>
							</li>
							</ul>
						</div>
						<div class="outInfo">
							<h4 class="subtitle">회원 탈퇴 안내</h4>
							<p class="notiHead">탈퇴시 주의사항</p>
							<ul>
							<li>
								<span>즉시 탈퇴 처리 및 기존 아이디 사용 불가</span>회원 탈퇴 시, 즉시 탈퇴 처리되며 기존에 가입하셨던 아이디로 재가입이 불가능합니다.
							</li>
							<li>
								<span>적립금/혜택 소멸 및 재가입시 복구 불가</span>회원 탈퇴 시, 회원님 아이디에 등록된 적립금과 우수고객등급에 따른 혜택은 모두 소멸되어, 재가입하더라도 복구되지 않습니다.(할인쿠폰 등)
							</li>
							<li>
								<span>유료회원 서비스이용 및 복구 불가</span>회원 탈퇴 시, 유료회원 서비스 이용이 불가하며, 재가입하더라도 복구되지 않습니다.
								<br>따라서 KBG 회원 탈퇴 이전에 반드시 확인하시기 바랍니다.
							</li>
							<li>
								<span>관계법령에 따른 주문번호는 회원 탈퇴 후 5년간 보존</span>전자상거래 등에서의 소비자 보호에 관한 법률 제6조(거래기록의 보존 등)에 의거, 주문정보는 회원 탈퇴 후 5년간 보존됩니다.
							</li>
							</ul>
							<p class="notiHead">게시글 안내사항</p>
							<ul>
							<li class="blGray">상품리뷰와 1:1 문의와 같은 게시판형 서비스에 등록 된 게시물은 탈퇴 후에도 자동 삭제 되지 않습니다.</li>
							<li class="blGray">상품에 관한 댓글, 답글과 같이 게시판형 서비스가 아닌곳에 등록 된 게시물은 탈퇴후에  자동 삭제 됩니다.</li>
							</ul>
						</div>
						
							<p>
								<label for="id">ID</label>
								<input type="text" id="id" name="id" value="${account.id}">
							</p>
							<br>
							<p>
								<label for="pw">PW</label>
								<input type="password" id="pw" name="pw">
							</p>
							
							<c:if test="${msg == false }">
 								<p>입력한 비밀번호가 잘 못 되었습니다.</p>
							</c:if>
						
						<div class="interBtnArea">
							<span>
							<button type="submit" class="btnblue">동의</button>
							</span>
							<span>
							<input type="button" class="btnWhite" onclick="history.back();" value="취소">
							</span>
						</div>
						</div>
					</div>
				</form>		
			</div>
		</div>

</body>
</html>