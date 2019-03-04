<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스팅 interPage</title>
</head>

<body>
	<c:if test="${account == null}">
	<form role="form" method="post" autocomplete="off" action="login.do">
		<p>
			<label for="id">ID</label>
			<input type="text" id="id" name="id"/>
		</p>
		<p>
			<label for="pw">PW</label>
			<input type="password" id="pw" name="pw"/>
		</p>
		<p><button type="submit">로그인</button></p>
		<p><a href="signUp/signUp.do">회원가입</a>
	</form>
	</c:if>
	
	<c:if test="${msg == false}">
		<p style="color:#f00;">로그인에 실패했습니다. ID 또는 PW를 다시 입력해주세요.</p>
	</c:if>
	
	<c:if test="${account != null}">
		<p>${account.name}님 환영합니다.</p>
		<a href="logout.do">로그아웃</a>
	</c:if>
	
	<h1>
		<a href="/">home.do</a> <a href="product.do">product.do</a>
	</h1>
	
	<h1>
		<a href="admin.do">admin페이지</a>
	</h1>
	
	<h1>
		<a href="main.do">마이페이지</a>
		<a href="delete.do">회원탈퇴</a>
	</h1>
	
	<h1>
		<a href="signUp/signUp.do">회원가입 테스트</a>
		<a href="list.do">회원리스트</a>
	</h1>
	
	<h1>
		<a href="change.do">수정페이지 가기전</a>
	</h1>
	
	<h1>
		<a href="refer.do">주문/배송조회</a>
	</h1>
	
	<h1>
		<a href="orderList.do">주문내역</a>
	</h1>
	
</body>
</html>