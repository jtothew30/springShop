<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자페이지-판매글관리</title>
<link rel="stylesheet" href="../resources/css/foundation.css">
<style type="text/css">
	.table-expand {
		margin-top: 2rem;
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
						<tr>
							<th>pbno</th>
							<th>img</th>
							<th>title</th>
							<th>pbdate</th>
							<th>price</th>
							<th>event</th>
							<th>totalsales</th>							
						</tr>
					</thead>
					<tbody>	
						<c:forEach items="${list}" var="list">					
						<tr>
							<td>${list.pbno}</td>
							<td><img src="/shop${list.path}/1.JPG" width="100" height="100"></td>
							<td><a href="../proboard/product.do?pbno=${list.pbno}">${list.title}</a></td>
							<td>${list.pbdate}</td>
							<td>${list.price}</td>
							<td>${list.event}</td>
							<td>${list.totalsales}</td>							
						</tr>
						</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- pageing template -->
	<ul class="pagination-pointed pagination text-center" role="navigation" aria-label="Pagination">
		<li class="pagination-previous disabled">Previous <span class="show-for-sr">page</span></li>
		<li class="current"><span class="show-for-sr">You're on page</span> 1</li>
		<li><a class="pagination-pointed-button" href="#" aria-label="Page 2">2</a></li>
		<li><a class="pagination-pointed-button" href="#" aria-label="Page 3">3</a></li>
		<li><a class="pagination-pointed-button" href="#" aria-label="Page 4">4</a></li>
		<li class="ellipsis" aria-hidden="true"></li>
		<li><a class="pagination-pointed-button" href="#" aria-label="Page 12">12</a></li>
		<li><a class="pagination-pointed-button" href="#" aria-label="Page 13">13</a></li>
		<li class="pagination-next"><a class="pagination-pointed-button" href="#" aria-label="Next page">Next <span class="show-for-sr">page</span></a></li>
	</ul>
	<!-- pageing -->
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
</body>
</html>