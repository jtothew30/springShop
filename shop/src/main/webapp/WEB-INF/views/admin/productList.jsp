<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자페이지-재고관리</title>
<link rel="stylesheet" href="../resources/css/foundation.css">
<style type="text/css">
.table-expand {
	margin-top: 5rem;
}

.table-expand td {
	color: #8a8a8a;
}

.table-expand tr {
	border: 1px solid #e6e6e6;
}

.table-expand .text-right {
	padding-right: 3rem;
}

.table-expand-row.is-active .expand-icon::after {
	content: '-';
}

.table-expand-row .expand-icon::after {
	content: '+';
	float: right;
}

.table-expand-row-content {
	display: none;
}

.table-expand-row-content.is-active {
	display: table-row;
	-webkit-animation: fadeIn ease-in 1;
	animation: fadeIn ease-in 1;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
	-webkit-animation-duration: 0.5s;
	animation-duration: 0.5s;
}

.table-expand-row-nested {
	background-color: #e6e6e6;
}

@
-webkit-keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
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
		<div class="row">
			<div class="columns">
				<table class="table-expand stack">
					<thead>
						<tr class="table-expand-row">
							<th>pno</th>
							<th>pname</th>
							<th>brand</th>
							<th>inprice</th>
							<th>outprice</th>
							<th>category1</th>
							<th>category2</th>
							<th>category3</th>
							<th>options</th>
							<th>script</th>
							<th>sales</th>
							<th>count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr class="table-expand-row" data-open-details>
								<td>${list.pno}</td>
								<td>${list.pname}</td>
								<td>${list.brand}</td>
								<td>${list.inprice}</td>
								<td>${list.outprice}</td>
								<td>${list.category1}</td>
								<td>${list.category2}</td>
								<td>${list.category3}</td>
								<td>${list.options}</td>
								<td>${list.script}</td>
								<td>${list.sales}</td>
								<c:choose>
									<c:when test="${list.count eq 0}">
										<td bgcolor="orange">${list.count}<span
											class="expand-icon"></span></td>
									</c:when>
									<c:otherwise>
										<td bgcolor="gray">${list.count}<span class="expand-icon"></span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="table-expand-row-content">
								<td colspan="12" class="table-expand-row-nested">
									<form action="proCountUpdate.do" method="post">
										<input type="hidden" name="pno" value="${list.pno}"> 현
										재고량 : <input type="text" name="count" value="${list.count}">
										<input type="submit" value="수정">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
		$('[data-open-details]').click(function(e) {
			e.preventDefault();
			$(this).next().toggleClass('is-active');
			$(this).toggleClass('is-active');
		});
	</script>
</body>
</html>