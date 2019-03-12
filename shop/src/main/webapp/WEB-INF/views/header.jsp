<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Header</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/foundation-icons/foundation-icons.css">
	
	<style type="text/css">
	.hidden {
	  display: none;
	}
	
	form > .row {
	  margin-bottom: 20px;
	}
	
	form > .row:last-child {
	  margin-bottom: 0;
	}
	
	form input.invalid {
	  border-color: #dc3545;
	}
	
	form .invalid-feedback {
	  color: #dc3545;
	  font-size: 14px;
	  line-height: 21px;
	  margin-top: 4px;
	  text-align: left;
	}
	</style>
	
</head>
<header>

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
			<li><a class="loginBtn">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/signUp/signUp.do">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/cart/cart.do">장바구니</a></li>
			<li><a href="${pageContext.request.contextPath}/account/mymain.do">마이페이지</a></li>
		</ul>

	</div>

	<!-- NOTE: This is the header menu that appears at the top of your site. -->
	<div class="off-canvas-content" data-off-canvas-content>
		<div class="ecommerce-header-top show-for-large">
			<div class="row align-justify">
				<div class="ecommerce-header-top-message">
					<h5 onclick="tomain();"><span class="title" style="cursor:pointer">온라인 쇼핑몰 KG쇼핑</span></h5>
				</div>
				<div class="ecommerce-header-top-links">
					<ul style="text-align: right;">
						<li>
							<c:if test="${empty sessionScope.account}">
								<a id="loginBtn" class="loginBtn">로그인</a>
							</c:if>
							<c:if test="${not empty sessionScope.account}">
								<a id="logoutBtn" style="">로그아웃</a>
							</c:if>
						</li>						
						<li><a href="${pageContext.request.contextPath}/signUp/signUp.do">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath}/cart/cart.do">장바구니</a><i class="fa fa-shopping-cart"></i></li>
						<li><a href="${pageContext.request.contextPath}/account/mymain.do">마이페이지</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="ecommerce-header-top show-for-large">
			<div class="column large-7 small-centered large-centered">
				<div style="margin: 0; padding:0; ">
					<ul class="dropdown menu" data-dropdown-menu>
						<li>
							<a href="#Item-1" class="title">
								<h5 style="color:#fff;">CATEGORY</h5>
							</a>
							<ul class="menu">
								<li><a href="#Item-1A">의류</a>
									<ul class="menu">
										<li><a onclick="linkP($(this).text());">여성의류</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">티셔츠</a></li>
												<li><a onclick="link($(this).text());">블라우스</a></li>
												<li><a onclick="link($(this).text());">원피스</a></li>
												<li><a onclick="link($(this).text());">가디건</a></li>
												<li><a onclick="link($(this).text());">바지/팬츠</a></li>
												<li><a onclick="link($(this).text());">스커트/치마</a></li>
												<li><a onclick="link($(this).text());">셔츠/남방</a></li>
												<li><a onclick="link($(this).text());">코트</a></li>
												<li><a onclick="link($(this).text());">점퍼</a></li>
												<li><a onclick="link($(this).text());">트레이닝복</a></li>
												<li><a onclick="link($(this).text());">니트/스웨터</a></li>
												<li><a onclick="link($(this).text());">정장세트</a></li>
												<li><a onclick="link($(this).text());">테마의상</a></li>
												<li><a onclick="link($(this).text());">조끼/베스트</a></li>
												<li><a onclick="link($(this).text());">비치웨어</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">남성의류</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">티셔츠</a></li>
												<li><a onclick="link($(this).text());">후드티</a></li>
												<li><a onclick="link($(this).text());">맨투맨</a></li>
												<li><a onclick="link($(this).text());">청바지</a></li>
												<li><a onclick="link($(this).text());">셔츠/남방</a></li>
												<li><a onclick="link($(this).text());">자켓</a></li>
												<li><a onclick="link($(this).text());">바지/팬츠</a></li>
												<li><a onclick="link($(this).text());">가디건</a></li>
												<li><a onclick="link($(this).text());">점퍼</a></li>
												<li><a onclick="link($(this).text());">정장/수트</a></li>
												<li><a onclick="link($(this).text());">코트</a></li>
												<li><a onclick="link($(this).text());">니트/스웨터</a></li>
												<li><a onclick="link($(this).text());">조끼/베스트</a></li>
												<li><a onclick="link($(this).text());">트레이닝복</a></li>
												<li><a onclick="link($(this).text());">비치웨어</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">아동복</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">여아의류</a></li>
												<li><a onclick="link($(this).text());">남아의류</a></li>
												<li><a onclick="link($(this).text());">주니어의류</a></li>
												<li><a onclick="link($(this).text());">한복</a></li>
												<li><a onclick="link($(this).text());">우의</a></li>
												<li><a onclick="link($(this).text());">테마의류</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">유아의류</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">여아의류</a></li>
												<li><a onclick="link($(this).text());">남아의류</a></li>
												<li><a onclick="link($(this).text());">배변훈련팬티</a></li>
												<li><a onclick="link($(this).text());">출산/백일/돌복</a></li>
												<li><a onclick="link($(this).text());">한복</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li>
									<a href="#Item-1B">잡화</a>
									<ul class="menu">
										<li><a onclick="linkP($(this).text());">여자신발</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">슬립온</a></li>
												<li><a onclick="link($(this).text());">스니커즈</a></li>
												<li><a onclick="link($(this).text());">운동화</a></li>
												<li><a onclick="link($(this).text());">캔버스화</a></li>
												<li><a onclick="link($(this).text());">펌프스/힐</a></li>
												<li><a onclick="link($(this).text());">로퍼</a></li>
												<li><a onclick="link($(this).text());">부티</a></li>
												<li><a onclick="link($(this).text());">플랫슈즈</a></li>
												<li><a onclick="link($(this).text());">키높이슈즈</a></li>
												<li><a onclick="link($(this).text());">샌들/조리/슬리퍼</a></li>
												<li><a onclick="link($(this).text());">부츠</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">남자신발</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">정장구두</a></li>
												<li><a onclick="link($(this).text());">스니커즈</a></li>
												<li><a onclick="link($(this).text());">로퍼</a></li>
												<li><a onclick="link($(this).text());">슬립온</a></li>
												<li><a onclick="link($(this).text());">캔버스화</a></li>
												<li><a onclick="link($(this).text());">운동화</a></li>
												<li><a onclick="link($(this).text());">컴포트화</a></li>
												<li><a onclick="link($(this).text());">키높이슈즈</a></li>
												<li><a onclick="link($(this).text());">샌들</a></li>
												<li><a onclick="link($(this).text());">조리/슬리퍼</a></li>
												<li><a onclick="link($(this).text());">워커/부츠</a></li>
											</ul>
										</li>
										<li>
											<a onclick="linkP($(this).text());">여자가방</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">숄더백</a></li>
												<li><a onclick="link($(this).text());">크로스백</a></li>
												<li><a onclick="link($(this).text());">백팩</a></li>
												<li><a onclick="link($(this).text());">토트백</a></li>
												<li><a onclick="link($(this).text());">클러치백</a></li>
												<li><a onclick="link($(this).text());">파우치</a></li>
												<li><a onclick="link($(this).text());">쇼퍼백</a></li>
												<li><a onclick="link($(this).text());">노트북가방</a></li>
												<li><a onclick="link($(this).text());">스포츠가방</a></li>
												<li><a onclick="link($(this).text());">캔버스/에코백</a></li>
												<li><a onclick="link($(this).text());">가방액세서리</a></li>
											</ul>
										</li>
										<li>
											<a onclick="linkP($(this).text());">남자가방</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">크로스백</a></li>
												<li><a onclick="link($(this).text());">서류가방</a></li>
												<li><a onclick="link($(this).text());">캔버스/에코백</a></li>
												<li><a onclick="link($(this).text());">힙색</a></li>
												<li><a onclick="link($(this).text());">숄더백</a></li>
												<li><a onclick="link($(this).text());">노트북가방</a></li>
												<li><a onclick="link($(this).text());">스포츠가방</a></li>
												<li><a onclick="link($(this).text());">토트백</a></li>
												<li><a onclick="link($(this).text());">카메라가방</a></li>
												<li><a onclick="link($(this).text());">클러치백</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">지갑/벨트</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">여성지갑</a></li>
												<li><a onclick="link($(this).text());">남성지갑</a></li>
												<li><a onclick="link($(this).text());">카드/명함지갑</a></li>
												<li><a onclick="link($(this).text());">카드목걸이</a></li>
												<li><a onclick="link($(this).text());">동전/통장 지갑</a></li>
												<li><a onclick="link($(this).text());">스마트폰 카드지갑</a></li>
												<li><a onclick="link($(this).text());">여성벨트</a></li>
												<li><a onclick="link($(this).text());">남성벨트</a></li>
												<li><a onclick="link($(this).text());">멜빵/서스펜더</a></li>
											</ul>
										</li>
										<li><a onclick="linkP($(this).text());">시계</a>
											<ul class="menu">
												<li><a onclick="link($(this).text());">남성시계</a></li>
												<li><a onclick="link($(this).text());">여성시계</a></li>
												<li><a onclick="link($(this).text());">시계소품</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="#Item-1C">뷰티</a>
									<ul class="menu">
										<li><a onclick="link($(this).text());">스킨케어</a></li>
										<li><a onclick="link($(this).text());">메이크업</a></li>
										<li><a onclick="link($(this).text());">남자화장품</a></li>
										<li><a onclick="link($(this).text());">바디케어</a></li>
										<li><a onclick="link($(this).text());">네일케어</a></li>
										<li><a onclick="link($(this).text());">뷰티소품</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<div class="small-5 large-5 columns">
							<li style="margin-top: 0.6em; padding:0;">
								<form action="${pageContext.request.contextPath}/search.do" id="searchProduct" name="searchProduct" >
									<input class="search" style="border-radius: 0.5em;display:inline;" type="text" name="kwd" placeholder="Find Stuff"
									 value="${paging.kwd}">
									<input type="hidden" id="opt2" name="optionKwd" value="${paging.optionKwd}">

							</li>
						</div>
						<div class="large-2 small-2 columns" style="padding: 8px;">
							<li>
									<input type="submit" id="searchPro" class="alert button expand" style="border-radius: 0.5em;" value="검색">
									</form>
							</li>
						</div>
					</ul>
				</div>
			</div>
		</div>
		<div class="ecommerce-header-top show-for-large">
		</div>
	</div>
	<div class="ecommerce-header-mobile hide-for-large">
		<div class="ecommerce-header-mobile-left">
			<button class="menu-icon" type="button" data-toggle="ecommerce-header"></button>
			<form class="ecommerce-header-search-exandable">
				<input type="search" placeholder="Search" value="${paging.kwd}">
			</form>
		</div>
		<!-- <div class="ecommerce-header-mobile-center">
		<a href="#"><img class="logo" src="https://placehold.it/130x30"></a>
	</div> -->
		<div class="ecommerce-header-mobile-right">
			<i class="fa fa-shopping-cart"></i>
		</div>
	</div>
	
	<!-- modal login form -->
	<div id="form-template" class="hidden">
	  <form>
	    <div class="row">
	      <div class="col-sm-12">
	        <input id="id" name="id" placeholder="UserID" class="swal-content__input" type="text">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-sm-12">
	        <input id="pw" name="pw" placeholder="Password" class="swal-content__input" type="password">
	      </div>
	    </div>
	  </form>    
	</div>
	<!-- <div class="row center-sm">
	  <div class="col-sm-12">
	    <p><button id="click-me-btn">Click me</button></p>
	  </div>
	</div> -->
	
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var ctx = "${pageContext.request.contextPath}";
		
		function link(text) {
			var listCate2 = [];
			var listCate3 = [];
			listCate3.push(text);
			var items = new Object();
			items.listCate2 = listCate2;
			items.listCate3 = listCate3;
			var opt2 = document.getElementById("opt2");
			opt2.value = JSON.stringify(items);
			$("#searchProduct").submit();
		}

		function linkP(text) {
			var listCate2 = [];
			var listCate3 = [];
			listCate2.push(text);
			var items = new Object();
			items.listCate2 = listCate2;
			items.listCate3 = listCate3;
			var opt2 = document.getElementById("opt2");
			opt2.value = JSON.stringify(items);
			$("#searchProduct").submit();
		}

		function tomain() {
			location.href = "${pageContext.request.contextPath}/main.do";
		}
		// store form HTML markup in a JS variable
		var formTemplate = $('#form-template > form').clone()[0];
		$('#form-template').remove();

		// prepare SweetAlert configuration
		var swalConfig = {
		  title: '로그인 페이지',		  
		  content: formTemplate,
		  button: {
		    text: 'Submit',
		    value: 'catch',
		    closeModal: false,
		  },
		  defeat: true,
		};

		// handle clicks on the "Click me" button
		$('#loginBtn').click(function () {
		  swal(swalConfig).then((value) =>{
			  switch (value) {
			  case 'catch':
				  loginRequest();
			  	  break;
			  case 'defeat':
				  break;
			  }
		   });
		});
		
		$(document).keypress(function(e) {
		  if ($("#swal-overlay").hasClass('swal-overlay--show-modal') && (e.keycode == 13 || e.which == 13)) {
			console.log("enter");
			loginRequest();
		  }
		});
		
		// handle clicks on the "Submit" button of the modal form
		/* $('body').on('click', '.swal-button--confirm', function() {			
		  loginRequest();
		}); */

		$('#logoutBtn').click(function(){
			swal("정말 로그아웃 하시겠습니까 ?", {
				  buttons: ["취소", true],
			}).then((value)=>{
				if(value == true){
					$.ajax({
						url : ctx + "/account/logoutAjax.do",
						type : "POST",
						data : {"result": true},
						"success" : function(data){
							console.log(data);
							if(data == "false"){
								swal({
									title:"로그아웃 실패",
									icon : "error"
								}).then((willDelete) => {
									location.reload();
								});
							} else if(data == "true"){
								swal({
									title:"로그아웃 성공",
									text : "즐거운 하루 되세요!",
									icon : "success"
								}).then((willDelete) => {
									location.reload();
								});
							} 
						},
						"error": function(data){
							console.log(data);
							swal({
								title:"서버문제",
								text : "관리자에게 문의하세요. (logoutRequest)",
								icon : "error"
							}).then((willDelete) => {
								swal.close();
							});
						}
					});
				}else{
					return;
				}
			});
		});
		
		function loginRequest(){
			$.ajax({
				url : ctx + "/account/loginAjax.do",
				type : "POST",
				data: {"id": $('#id').val(), "pw": $('#pw').val()},
				"success" : function(data){
					console.log(data);
					if(data == "false"){
						swal({
							title:"로그인 실패",
							text : "아이디와 비밀번호가 존재하지 않거나 일치하지 않습니다.",
							icon : "error"
						}).then((willDelete) => {
							location.reload();
							return;
						});
					} else if(data == "true"){
						swal({
							title:"로그인 성공",
							text : "환영합니다!",
							icon : "success"
						}).then((willDelete) => {
							location.reload();
							return;
						});
						$("#logoutBtn").show();
		      			$("#loginBtn").hide();
		      			//$(".admin").hide();
					} else if(data == "overlap") {
						swal({
							title:"로그인 실패",
							text : "이미 로그인되어있는 계정입니다.",
							icon : "error"
						}).then((willDelete) => {
							location.reload();
							return;
						});
					}
				},
				"error": function(data){
					console.log(data);
					swal({
						title:"서버문제",
						text : "관리자에게 문의하세요. (loginRequest)",
						icon : "error"
					}).then((willDelete) => {
						return;
					});
				}
			});
		}
	</script>
	
</header>

</html>