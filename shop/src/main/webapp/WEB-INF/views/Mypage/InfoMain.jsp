<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인화면</title>
<link rel="stylesheet" href="resources/css/mypage/common.css">
<link rel="stylesheet" href="resources/css/mypage/snb.css">
<link rel="stylesheet" href="resources/css/mypage/openid.css">
</head>

<body>

<form id="openIdForm" name="openIdForm" method="get">
			<div id="openIdWrap">
				<div class="interparkLogo" align="center">
					<img src="resources/image/logo.JPG">
				</div>
			
				<div class="contentsWrap">
					<div class="myInfoMain">
						<div class="memberClass">
							<div class="mylevel">
							<img src="resources/image/welcome.JPG">
							<p class="infoTxt">${account.name}님 <span>환영합니다!</span></p>
							</div>
						</div>
						<div class="mainMenu">
							<div class="menuBox infoModify">
								<a href="change.do?id=${account.id}">
									<p class="title">회원정보수정</p>
									<span class="noti">비밀번호, 휴대폰번호 등<br/>내정보를 보호하세요.</span>
								</a>
							</div>
							<div id="shipping" class="menuBox shipping">
								<a href="orderList.do">						
									<p class="title">주문/배송현황</p>
									<span class="noti">주문내역, 배송현환 등<br/>확인해보세요.</span>
								</a>
							</div>
							<div class="menuBox withdrawal">
								<a href="Mypage/AccountDelete?name=${account.name}">
									<p class="title">회원탈퇴</p>
									<span class="noti"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>


</body>
</html>