<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Header</title>
	<link rel="stylesheet" href="resources/css/foundation.css">
	<link rel="stylesheet" href="resources/css/app.css">
	<link rel="stylesheet" href="resources/foundation-icons/foundation-icons.css">
	<style type="text/css">
		.multilevel-accordion-menu .is-accordion-submenu-parent a {
			background: #4d5158;
		}

		.multilevel-accordion-menu .is-accordion-submenu a {
			background: #35383d;
		}

		.multilevel-accordion-menu .sublevel-1 {
			text-indent: 1rem;
		}

		.multilevel-accordion-menu .sublevel-2 {
			text-indent: 2rem;
		}

		.multilevel-accordion-menu .sublevel-3 {
			text-indent: 3rem;
		}

		.multilevel-accordion-menu .sublevel-4 {
			text-indent: 4rem;
		}

		.multilevel-accordion-menu .sublevel-5 {
			text-indent: 5rem;
		}

		.multilevel-accordion-menu .sublevel-6 {
			text-indent: 6rem;
		}

		.multilevel-accordion-menu a {
			color: #fefefe;
			box-shadow: inset 0 -1px #41444a;
		}

		.multilevel-accordion-menu a::after {
			border-color: #fefefe transparent transparent;
		}

		.multilevel-accordion-menu .menu>li:not(.menu-text)>a {
			padding: 1.2rem 1rem;
		}

		.multilevel-accordion-menu .is-accordion-submenu-parent[aria-expanded="true"] a.subitem::before {
			content: "\f016";
			font-family: FontAwesome;
			margin-right: 1rem;
		}

		.multilevel-accordion-menu .is-accordion-submenu-parent[aria-expanded="true"] a::before {
			content: "\f07c";
			font-family: FontAwesome;
			margin-right: 1rem;
		}

		.multilevel-accordion-menu .is-accordion-submenu-parent[aria-expanded="false"] a::before {
			content: "\f07b";
			font-family: FontAwesome;
			margin-right: 1rem;
		}
	</style>
</head>
<%-- 
<!-- Start Top Bar -->
<!-- 	<div class="top-bar top-bar-center">
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
	</div> -->
<!-- End Top Bar -->
--%>
<!-- NOTE: This is the off-canvas menu that appears when you click on the hamburger menu on smaller screens. Everything in the `.off-canvas` div belongs in `src/layouts/default.html`. Copy this section into the `default.html` file and remove it from this file.  -->
<div class="off-canvas ecommerce-header-off-canvas position-left" id="ecommerce-header" data-off-canvas>

	<!-- Close button -->
	<button class="close-button" aria-label="Close menu" type="button" data-close>
		<span aria-hidden="true">&times;</span>
	</button>
	<br>
	<ul class="multilevel-accordion-menu vertical menu" data-accordion-menu>
		<li>
			<a href="#">의류</a>
			<ul class="menu vertical sublevel-1">
				<li>
					<a href="#">여성의류</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">티셔츠</a></li>
						<li><a href="#">블라우스</a></li>
						<li><a href="#">원피스</a></li>
						<li><a href="#">가디건</a></li>
						<li><a href="#">바지/팬츠</a></li>
						<li><a href="#">스커트/치마</a></li>
						<li><a href="#">셔츠/남방</a></li>
						<li><a href="#">코트</a></li>
						<li><a href="#">점퍼</a></li>
						<li><a href="#">트레이닝복</a></li>
						<li><a href="#">니트/스웨터</a></li>
						<li><a href="#">정장세트</a></li>
						<li><a href="#">테마의상</a></li>
						<li><a href="#">조끼/베스트</a></li>
						<li><a href="#">비치웨어</a></li>
					</ul>
				</li>
				<li>
					<a href="#">남성의류</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">티셔츠</a></li>
						<li><a href="#">후드티</a></li>
						<li><a href="#">맨투맨</a></li>
						<li><a href="#">청바지</a></li>
						<li><a href="#">셔츠/남방</a></li>
						<li><a href="#">자켓</a></li>
						<li><a href="#">바지/팬츠</a></li>
						<li><a href="#">가디건</a></li>
						<li><a href="#">점퍼</a></li>
						<li><a href="#">정장/수트</a></li>
						<li><a href="#">코트</a></li>
						<li><a href="#">니트/스웨터</a></li>
						<li><a href="#">조끼/베스트</a></li>
						<li><a href="#">트레이닝복</a></li>
						<li><a href="#">비치웨어</a></li>
					</ul>
				</li>
				<li>
					<a href="#">아동복</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">여아의류</a></li>
						<li><a href="#">남아의류</a></li>
						<li><a href="#">주니어의류</a></li>
						<li><a href="#">한복</a></li>
						<li><a href="#">우의</a></li>
						<li><a href="#">테마의류</a></li>
					</ul>
				</li>
				<li>
					<a href="#">유아의류</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">여아의류</a></li>
						<li><a href="#">남아의류</a></li>
						<li><a href="#">배변훈련팬티</a></li>
						<li><a href="#">출산/백일/돌복</a></li>
						<li><a href="#">한복</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<a href="#">잡화</a>
			<ul class="menu vertical sublevel-1">
				<li><a class="subitem" href="#">여자신발</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">슬립온</a></li>
						<li><a href="#">스니커즈</a></li>
						<li><a href="#">운동화</a></li>
						<li><a href="#">캔버스화</a></li>
						<li><a href="#">펌프스/힐</a></li>
						<li><a href="#">로퍼</a></li>
						<li><a href="#">부티</a></li>
						<li><a href="#">플랫슈즈</a></li>
						<li><a href="#">키높이슈즈</a></li>
						<li><a href="#">샌들/조리/슬리퍼</a></li>
						<li><a href="#">부츠</a></li>
					</ul>
				</li>
				<li><a class="subitem" href="#">남자신발</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">정장구두</a></li>
						<li><a href="#">스니커즈</a></li>
						<li><a href="#">로퍼</a></li>
						<li><a href="#">슬립온</a></li>
						<li><a href="#">캔버스화</a></li>
						<li><a href="#">운동화</a></li>
						<li><a href="#">컴포트화</a></li>
						<li><a href="#">키높이슈즈</a></li>
						<li><a href="#">샌들</a></li>
						<li><a href="#">조리/슬리퍼</a></li>
						<li><a href="#">워커/부츠</a></li>
					</ul>
				</li>
				<li><a class="subitem" href="#">여자가방</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">숄더백</a></li>
						<li><a href="#">크로스백</a></li>
						<li><a href="#">백팩</a></li>
						<li><a href="#">토트백</a></li>
						<li><a href="#">클러치백</a></li>
						<li><a href="#">파우치</a></li>
						<li><a href="#">쇼퍼백</a></li>
						<li><a href="#">노트북가방</a></li>
						<li><a href="#">스포츠가방</a></li>
						<li><a href="#">캔버스/에코백</a></li>
						<li><a href="#">가방액세서리</a></li>
					</ul>
				</li>
				<li><a class="subitem" href="#">남자가방</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">크로스백</a></li>
						<li><a href="#">서류가방</a></li>
						<li><a href="#">캔버스/에코백</a></li>
						<li><a href="#">힙색</a></li>
						<li><a href="#">숄더백</a></li>
						<li><a href="#">노트북가방</a></li>
						<li><a href="#">스포츠가방</a></li>
						<li><a href="#">토트백</a></li>
						<li><a href="#">카메라가방</a></li>
						<li><a href="#">클러치백</a></li>
					</ul>
				</li>
				<li><a class="subitem" href="#">지갑/벨트</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">여성지갑</a></li>
						<li><a href="#">남성지갑</a></li>
						<li><a href="#">카드/명함지갑</a></li>
						<li><a href="#">카드목걸이</a></li>
						<li><a href="#">동전/통장 지갑</a></li>
						<li><a href="#">스마트폰 카드지갑</a></li>
						<li><a href="#">여성벨트</a></li>
						<li><a href="#">남성벨트</a></li>
						<li><a href="#">멜빵/서스펜더</a></li>
					</ul>
				</li>
				<li><a class="subitem" href="#">시계</a>
					<ul class="menu vertical sublevel-2">
						<li><a href="#">남성시계</a></li>
						<li><a href="#">여성시계</a></li>
						<li><a href="#">시계소품</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<a href="#">뷰티</a>
			<ul class="menu vertical sublevel-1">
				<li><a class="subitem" href="#">Thing 1</a></li>
				<li><a class="subitem" href="#">Thing 2</a></li>
			</ul>
		</li>

	</ul>

	<hr>

	<!-- Menu -->
	<ul class="menu vertical">
		<li><a href="#">로그인</a></li>
		<li><a href="signUp/signUp.do">회원가입</a></li>
		<li><a href="cart/cart.do">장바구니</a></li>
		<li><a href="#">마이페이지</a></li>
	</ul>

</div>

<!-- NOTE: This is the header menu that appears at the top of your site. -->
<div class="off-canvas-content" data-off-canvas-content>
	<div class="ecommerce-header-top show-for-large">
		<div class="row align-justify">
			<div class="ecommerce-header-top-message">
				<h5> 온라인 쇼핑몰 KG쇼핑</h5>
			</div>
			<div class="ecommerce-header-top-links">
				<ul align="right">
					<li><a href="#">로그인</a></li>
					<li><a href="signUp/signUp.do">회원가입</a></li>
					<li><a href="cart/cart.do">장바구니</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#" target="_blank"><i class="fa fa-shopping-cart"></i></a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="ecommerce-header show-for-large">
		<div class="row">
			<div class="columns">
				<ul class="dropdown menu" data-dropdown-menu>
					<li>
						<a href="#Item-1" style="margin-top:15px; padding-top: 2px;">
							<h6>카테고리</h6>
						</a>
						<ul class="menu">
							<li><a href="#Item-1A">의류</a>
								<ul class="menu">
									<li><a href="#Item-1Bi">여성의류</a>
										<ul class="menu">
											<li><a href="#">티셔츠</a></li>
											<li><a href="#">블라우스</a></li>
											<li><a href="#">원피스</a></li>
											<li><a href="#">가디건</a></li>
											<li><a href="#">바지/팬츠</a></li>
											<li><a href="#">스커트/치마</a></li>
											<li><a href="#">셔츠/남방</a></li>
											<li><a href="#">코트</a></li>
											<li><a href="#">점퍼</a></li>
											<li><a href="#">트레이닝복</a></li>
											<li><a href="#">니트/스웨터</a></li>
											<li><a href="#">정장세트</a></li>
											<li><a href="#">테마의상</a></li>
											<li><a href="#">조끼/베스트</a></li>
											<li><a href="#">비치웨어</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">남성의류</a>
										<ul class="menu">
											<li><a href="#">티셔츠</a></li>
											<li><a href="#">후드티</a></li>
											<li><a href="#">맨투맨</a></li>
											<li><a href="#">청바지</a></li>
											<li><a href="#">셔츠/남방</a></li>
											<li><a href="#">자켓</a></li>
											<li><a href="#">바지/팬츠</a></li>
											<li><a href="#">가디건</a></li>
											<li><a href="#">점퍼</a></li>
											<li><a href="#">정장/수트</a></li>
											<li><a href="#">코트</a></li>
											<li><a href="#">니트/스웨터</a></li>
											<li><a href="#">조끼/베스트</a></li>
											<li><a href="#">트레이닝복</a></li>
											<li><a href="#">비치웨어</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">아동복</a>
										<ul class="menu">
											<li><a href="#">여아의류</a></li>
											<li><a href="#">남아의류</a></li>
											<li><a href="#">주니어의류</a></li>
											<li><a href="#">한복</a></li>
											<li><a href="#">우의</a></li>
											<li><a href="#">테마의류</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">유아의류</a>
										<ul class="menu">
											<li><a href="#">여아의류</a></li>
											<li><a href="#">남아의류</a></li>
											<li><a href="#">배변훈련팬티</a></li>
											<li><a href="#">출산/백일/돌복</a></li>
											<li><a href="#">한복</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<a href="#Item-1B">잡화</a>
								<ul class="menu">
									<li><a href="#Item-1Bi">여자신발</a>
										<ul class="menu">
											<li><a href="#">슬립온</a></li>
											<li><a href="#">스니커즈</a></li>
											<li><a href="#">운동화</a></li>
											<li><a href="#">캔버스화</a></li>
											<li><a href="#">펌프스/힐</a></li>
											<li><a href="#">로퍼</a></li>
											<li><a href="#">부티</a></li>
											<li><a href="#">플랫슈즈</a></li>
											<li><a href="#">키높이슈즈</a></li>
											<li><a href="#">샌들/조리/슬리퍼</a></li>
											<li><a href="#">부츠</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">남자신발</a>
										<ul class="menu">
											<li><a href="#">정장구두</a></li>
											<li><a href="#">스니커즈</a></li>
											<li><a href="#">로퍼</a></li>
											<li><a href="#">슬립온</a></li>
											<li><a href="#">캔버스화</a></li>
											<li><a href="#">운동화</a></li>
											<li><a href="#">컴포트화</a></li>
											<li><a href="#">키높이슈즈</a></li>
											<li><a href="#">샌들</a></li>
											<li><a href="#">조리/슬리퍼</a></li>
											<li><a href="#">워커/부츠</a></li>
										</ul>
									</li>
									<li>
										<a href="#Item-1Biii">여자가방</a>
										<ul class="menu">
											<li><a href="#">숄더백</a></li>
											<li><a href="#">크로스백</a></li>
											<li><a href="#">백팩</a></li>
											<li><a href="#">토트백</a></li>
											<li><a href="#">클러치백</a></li>
											<li><a href="#">파우치</a></li>
											<li><a href="#">쇼퍼백</a></li>
											<li><a href="#">노트북가방</a></li>
											<li><a href="#">스포츠가방</a></li>
											<li><a href="#">캔버스/에코백</a></li>
											<li><a href="#">가방액세서리</a></li>
										</ul>
									</li>
									<li>
										<a href="#">남자가방</a>
										<ul class="menu">
											<li><a href="#">크로스백</a></li>
											<li><a href="#">서류가방</a></li>
											<li><a href="#">캔버스/에코백</a></li>
											<li><a href="#">힙색</a></li>
											<li><a href="#">숄더백</a></li>
											<li><a href="#">노트북가방</a></li>
											<li><a href="#">스포츠가방</a></li>
											<li><a href="#">토트백</a></li>
											<li><a href="#">카메라가방</a></li>
											<li><a href="#">클러치백</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">지갑/벨트</a>
										<ul class="menu">
											<li><a href="#">여성지갑</a></li>
											<li><a href="#">남성지갑</a></li>
											<li><a href="#">카드/명함지갑</a></li>
											<li><a href="#">카드목걸이</a></li>
											<li><a href="#">동전/통장 지갑</a></li>
											<li><a href="#">스마트폰 카드지갑</a></li>
											<li><a href="#">여성벨트</a></li>
											<li><a href="#">남성벨트</a></li>
											<li><a href="#">멜빵/서스펜더</a></li>
										</ul>
									</li>
									<li><a href="#Item-1Bii">시계</a>
										<ul class="menu">
											<li><a href="#">남성시계</a></li>
											<li><a href="#">여성시계</a></li>
											<li><a href="#">시계소품</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<li><a href="#Item-1C">뷰티</a>
								<ul class="menu">
									<li><a href="#">스킨케어</a></li>
									<li><a href="#">메이크업</a></li>
									<li><a href="#">남자화장품</a></li>
									<li><a href="#">바디케어</a></li>
									<li><a href="#">네일케어</a></li>
									<li><a href="#">뷰티소품</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<p>
						<li class="has-form" style="margin-top: 10px;">
							<div class="row ">
								<div class="large-8 small-9 columns">
									<form action="search.do" id="searchProduct" name="searchProduct">
										<input type="text" name="kwd" placeholder="Find Stuff" value="${paging.kwd}">
										<input type="hidden" id="opt2" name="optionKwd" value="${paging.optionKwd}">										
								</div>
							</div>
						</li>
						<li>
							<div class="large-4 small-3 columns" style="padding: 8px">
								<input type="submit" id="searchPro" class="alert button expand" value="검색">
								</form>
							</div>
						</li>
				</ul>
			</div>
		</div>
	</div>
</div>


<div class="ecommerce-header-mobile hide-for-large">
	<div class="ecommerce-header-mobile-left">
		<button class="menu-icon" type="button" data-toggle="ecommerce-header"></button>
		<form class="ecommerce-header-search-exandable">
			<input type="search" placeholder="Search" value="${paging.kwd}">
		</form>
	</div>
	<div class="ecommerce-header-mobile-center">
		<a href="#"><img class="logo" src="https://placehold.it/130x30"></a>
	</div>
	<div class="ecommerce-header-mobile-right">
		<i class="fa fa-shopping-cart"></i>
	</div>
</div>
</div>


</html>