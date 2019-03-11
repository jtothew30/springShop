<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/snb.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/openid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/foundation-icons/foundation-icons.css">
</head>
<c:import url="../header.jsp"/>
<body>

<form id="openIdForm" name="openIdForm" method="get">
			<div id="openIdWrap">
				<div class="interparkLogo" align="center">
					<img src="${pageContext.request.contextPath}/resources/image/logo.JPG">
				</div>
			
				<div class="contentsWrap">
					<div class="myInfoMain">
						<div class="memberClass">
							<div class="mylevel">
							<img src="${pageContext.request.contextPath}/resources/image/welcome.JPG">
							<p class="infoTxt">${sessionScope.account}님 <span>환영합니다!</span></p>
							</div>
						</div>
						<div class="mainMenu">
							<div class="menuBox infoModify">
								<a href="${pageContext.request.contextPath}/account/change.do?id=${sessionScope.account}">
									<p class="title">회원정보수정</p>
									<span class="noti">비밀번호, 휴대폰번호 등<br/>내정보를 보호하세요.</span>
								</a>
							</div>
							<div id="shipping" class="menuBox shipping">
								<a href="${pageContext.request.contextPath}/account/orderList.do">						
									<p class="title">주문/배송현황</p>
									<span class="noti">주문내역, 배송현환 등<br/>확인해보세요.</span>
								</a>
							</div>
							<div class="menuBox withdrawal">
								<a href="${pageContext.request.contextPath}/account/AccountDelete?name=${sessionScope.account}">
									<p class="title">회원탈퇴</p>
									<span class="noti"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

<c:import url="../footer.jsp"/>
</body>
</html>