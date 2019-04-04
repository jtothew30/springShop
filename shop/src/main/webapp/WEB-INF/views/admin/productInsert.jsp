<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="../resources/css/foundation.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style type="text/css">
		@media screen and (max-width: 39.9375em) {
			.button.small-only-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media screen and (min-width: 40em) and (max-width: 63.9375em) {
			.button.medium-only-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media screen and (max-width: 63.9375em) {
			.button.medium-down-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media print,
		screen and (min-width: 40em) {
			.button.medium-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media screen and (min-width: 64em) and (max-width: 74.9375em) {
			.button.large-only-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media screen and (max-width: 74.9375em) {
			.button.large-down-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		@media print,
		screen and (min-width: 64em) {
			.button.large-expanded {
				display: block;
				width: 100%;
				margin-right: 0;
				margin-left: 0;
			}
		}

		.ui-autocomplete {
			max-height: 100px;
			overflow-y: auto;
			/* prevent horizontal scrollbar */
			overflow-x: hidden;
		}

		/* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
		* html .ui-autocomplete {
			height: 100px;
		}
	</style>
</head>

<body>
	<c:import url="adminNav.jsp" />
	<div class="off-canvas-content" data-off-canvas-content>
		<div class="title-bar hide-for-large">
			<div class="title-bar-left">
				<button class="menu-icon" type="button" data-open="my-info"></button>
				<span class="title-bar-title">관리자 페이지</span>
			</div>
		</div>
		<div class="callout primary">
			<div class="row column">
				<h1>안녕? 제품등록 페이지 입니다.</h1>
				<p class="lead">너희들의 월급만큼 일해라</p>
			</div>
		</div>
		<div class="callout primary">
			<div class="row">
				<div class="columns large-2">
					<form name="productInsertForm" action="productInsert.do" method="post">
						<h5>제품명:</h5>
				</div>
				<div class="columns large-5 end">
					<input name="pname" type="text" value="${pro.pname}">
				</div>
			</div>
			<div class="row">
				<div class="columns large-3"></div>
				<div class="columns large-3">
					<p>
						제조사명:<input name="brand" type="text" value="${pro.brand}">
					</p>
				</div>
				<div class="columns large-2">
					<p>
						입고가격:<input name="inprice" type="text" value="${pro.inprice}">
					</p>
				</div>
				<div class="columns large-2 end">
					<p>
						판매가격:<input name="outprice" type="text" value="${pro.outprice}">
					</p>
				</div>
			</div>
			<div class="row">
				<div class="columns large-3">
					<p>
						카테고리1:<input name="category1" class="category1" type="text" value="${pro.category1}">
					</p>
				</div>
				<div class="columns large-1"></div>
				<div class="columns large-3 end">
					<p>
						카테고리2:<input name="category2" class="category2" type="text" value="${pro.category2}">
					</p>
				</div>
			</div>
			<div class="row">
				<div class="columns large-7 end">
					<p>
						카테고리3:<input name="category3" class="category3" type="text" value="${pro.category3}">
					</p>
				</div>
			</div>
			<div class="row">
				<div class="columns large-7 end">
					<p>
						옵션:<input name="options" type="text" placeholder="${pro.options}">
					</p>
				</div>
			</div>
			<div class="row">
				<div class="columns large-7 end">
					<p>
						부가설명:
						<textarea name="script" rows="3">${pro.script}</textarea>
					</p>
				</div>
			</div>
			<input type="hidden" name="sales" value="0">

		</div>

		<div class="row column">
			<input class="alert button large-down-expanded" type="reset" value="취소"> <input class="sucssess button large-down-expanded"
			 type="submit" value="등록">
		</div>
		</form>
		<hr>
	</div>


	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
		$('input[type="text"]').keydown(function() {
		    if (event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
		$('input[type="textarea"]').keydown(function() {
		    if (event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
		$(function () {
			var category1 = ["의류", "잡화", "뷰티"];
			$(".category1").autocomplete({
				source: category1
			});
		});
		$(function () {
			var category2 = ["여성의류", "남성의류", "아동복", "유아의류", "여자신발", "남자신발",
				"여자가방", "남자가방", "지갑/벨트", "시계"
			];
			$(".category2").autocomplete({
				source: category2
			});
		});
		$(function () {
			var category3 = ["티셔츠", "블라우스", "원피스", "가디건", "바지/팬츠", "스커트/치마",
				"셔츠/남방", "코트", "점퍼", "트레이닝복", "니트/스웨터", "정장세트", "테마의상",
				"조끼/베스트", "비치웨어", "티셔츠", "후드티", "맨투맨", "청바지", "셔츠/남방",
				"자켓", "바지/팬츠", "가디건", "점퍼", "정장/수트", "코트", "니트/스웨터",
				"조끼/베스트", "트레이닝복", "비치웨어", "여아의류", "남아의류", "주니어의류", "한복",
				"우의", "테마의류", "여아의류", "남아의류", "배변훈련팬티", "출산/백일/돌복", "한복",
				"슬립온", "스니커즈", "운동화", "캔버스화", "펌프스/힐", "로퍼", "부티", "플랫슈즈",
				"키높이슈즈", "샌들/조리/슬리퍼", "부츠", "정장구두", "스니커즈", "로퍼", "슬립온",
				"캔버스화", "운동화", "컴포트화", "키높이슈즈", "샌들", "조리/슬리퍼", "워커/부츠",
				"숄더백", "크로스백", "백팩", "토트백", "클러치백", "파우치", "쇼퍼백", "노트북가방",
				"스포츠가방", "캔버스/에코백", "가방액세서리", "크로스백", "서류가방", "캔버스/에코백",
				"힙색", "숄더백", "노트북가방", "스포츠가방", "토트백", "카메라가방", "클러치백",
				"여성지갑", "남성지갑", "카드/명함지갑", "카드목걸이", "동전/통장 지갑",
				"스마트폰 카드지갑", "여성벨트", "남성벨트", "멜빵/서스펜더", "남성시계", "여성시계",
				"시계소품"
			];
			$(".category3").autocomplete({
				source: category3
			});
		});
	</script>
</body>

</html>