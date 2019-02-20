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
				<table class="stack">
					<thead>
						<tr>
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
						</tr>
					</thead>
					<tbody>	
						<c:forEach items="${list}" var="product">					
						<tr>
							<td>${product.pno}</td>
							<td>${product.pname}</td>
							<td>${product.brand}</td>
							<td>${product.inprice}</td>
							<td>${product.outprice}</td>
							<td>${product.category1}</td>
							<td>${product.category2}</td>
							<td>${product.category3}</td>
							<td>${product.options}</td>
							<td>${product.script}</td>
							<td>${product.sales}</td>
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
</body>
</html>