<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<title>Header</title>
	<link rel="stylesheet" href="resources/css/foundation.css">
</head>

<body>
	<!-- Start Top Bar -->
	<div class="top-bar top-bar-center">
		<div align="center">
			<img src="resources/foundation-icons/svgs/fi-shopping-cart.svg" height="65" width="68">
			<font size="30" bold>온라인 쇼핑몰 KG쇼핑</font><br>
		</div>
	</div>
	<div class="top-bar">
		<div class="top-bar-left">
			<ul class="dropdown menu" data-dropdown-menu="" role="menubar" data-e="n2avhw-e">
				<li class="has-submenu is-dropdown-submenu-parent opens-right" role="menuitem" aria-haspopup="true" aria-label="One">
					<a href="#">카테고리</a>
					<ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" role="menu">
						<li role="menuitem" class="is-submenu-item is-dropdown-submenu-item"><a href="#">One</a></li>
						<li role="menuitem" class="is-submenu-item is-dropdown-submenu-item"><a href="#">Two</a></li>
						<li role="menuitem" class="is-submenu-item is-dropdown-submenu-item"><a href="#">Three</a></li>
					</ul>
				</li>
				<li><input type="search" placeholder="Search"></li>
				<li><button type="button" class="button">Search</button></li>
			</ul>
		</div>
		<div class="top-bar-right">
			<ul class="menu">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
		</div>
	</div>
	<!-- End Top Bar -->
</body>

</html>