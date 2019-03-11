<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>관리</title>
	<link rel="stylesheet" href="../resources/css/foundation.css">
</head>

<body>
	<div class="off-canvas-wrapper">
		<div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
			<div class="off-canvas position-left reveal-for-large" id="my-info" data-off-canvas data-position="left">
				<div class="row column">
					<object type="image/svg+xml" data="../resources/foundation-icons/svgs/fi-address-book.svg">아이콘</object>
					<p class="lead"><a href="../index.jsp">index</a></p>
				</div>
				<div class="row column expended">
					<a href="productInsert.do"> <img src="../resources/foundation-icons/svgs/fi-plus.svg" height="60" width="60"><b>&nbsp;상품 등록</b>
					</a>
				</div>
				<div class="row column expended">
					<a href="productList.do"> <img src="../resources/foundation-icons/svgs/fi-clipboard-notes.svg" height="60" width="60"><b>재고
							관리</b>
					</a>
				</div>
				<hr>
				<div class="row column expended">
					<a href="boardInsert.do"> <img src="../resources/foundation-icons/svgs/fi-page-export.svg" height="60" width="60"><b>상품판매글
							등록</b>
					</a>
				</div>
				<div class="row column expended">
					<a href="boardList.do"> <img src="../resources/foundation-icons/svgs/fi-wrench.svg" height="60" width="60"><b>판매글
							관리</b>
					</a>
				</div>
				<hr>
				<div class="row column expended">
					<a href="memberList.do"> <img src="../resources/foundation-icons/svgs/fi-results-demographics.svg" height="60" width="60"><b>회원 관리</b>
					</a>
				<div class="row column expended">
					<a href="#"> <img src="../resources/foundation-icons/svgs/fi-graph-bar.svg" height="60" width="60"><b>이용자 통계</b>
					</a>
				</div>
				<hr>
				<div class="row column expended">
					<a href="mainEdit.do"> <img src="../resources/foundation-icons/svgs/fi-price-tag.svg" height="60" width="60"><b>메인 광고 설정</b>
					</a>
				</div>
				</div>
				<!-- <div class="row column expended">
					<a href="#"> <img src="../resources/foundation-icons/svgs/fi-price-tag.svg" height="60" width="60"><b>할인 중 상품 설정</b>
					</a>
				</div> -->

			</div>
		</div>
</body>

</html>