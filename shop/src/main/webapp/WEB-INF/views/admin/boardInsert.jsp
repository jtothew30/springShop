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

@media print , screen and (min-width: 40em) {
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

@media print , screen and (min-width: 64em) {
	.button.large-expanded {
		display: block;
		width: 100%;
		margin-right: 0;
		margin-left: 0;
	}
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
				<h1>안녕? 판매글 등록 페이지 입니다.</h1>
				<p class="lead">배고프다</p>
			</div>
		</div>
		<div class="callout primary">
			<div class="row column">
				<form name="boardInsertForm" action="boardInsert.do" method="post" enctype="multipart/form-data">
					<div class="row column">
						<p>
							글 제목:<input name="title" type="text">
						</p>
					</div>
					<div class="row column">
						<p>
							원 가격:<input name="price" type="text">
						</p>
					</div>
					<div class="row column">
						<p>
							할인가격:<input name="event" type="text">
						</p>
					</div>
					<div class="row column">
						<p>
							판매량:<input name="totalsales" type="text">
						</p>
					</div>
					<div class="row column">
						<p>
							<label>제품선택:</label> 
							<select name="pname" id="pnameSelect" onchange="change1();">
								<option selected>---선택하시오---</option>
								<c:forEach items="${list}" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</p>
					</div>
					<div class="row column">
						<p>
							<label>옵션선택:</label>
						<div id="optionSelect"></div>
						</p>
					</div>
					<div class="row column">
						<p>
							<label>상품이미지 등록:</label> 
							<input multiple="multiple" type="file" name="file" />
						</p>
					</div>							
			</div>
			<div class="row column">
				<input class="alert button large-down-expanded" type="reset" value="취소">
				 <input	class="sucssess button large-down-expanded" type="submit" value="등록">
			</div>
			</form>
			<hr>
		</div>
	</div>
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
		function change1() {
			var selected = $("#pnameSelect option:selected").val();
			$("#optionSelect > *").remove();
			var str = "";
			<c:forEach var="pl" items="${plist}">
			if ('${pl.pname}' == selected) {
				str += ("<input type='checkbox' name='options' value="+"${pl.options}"+">"
						+ "${pl.options}" + "&nbsp;");
				str += ("<input type='hidden' name='category1' value="+"${pl.category1}"+">");
				str += ("<input type='hidden' name='category2' value="+"${pl.category2}"+">");
				str += ("<input type='hidden' name='category3' value="+"${pl.category3}"+">");
			}
			</c:forEach>
			$("#optionSelect").html(str);
		}
	</script>
</body>

</html>