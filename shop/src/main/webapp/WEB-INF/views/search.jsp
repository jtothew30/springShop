<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품 검색</title>
<link rel="stylesheet" href="../resources/css/foundation.css">
<link rel="stylesheet" href="../resources/foundation-icons/foundation-icons.css">
<style type="text/css">

.product-card {
  background-color: #fefefe;
  border: 1px solid #e6e6e6;
  padding: 1rem;
  margin-bottom: 1.5rem;
}

.product-card-thumbnail {
  display: block;
  position: relative;
}

.product-card-title {
  font-family: 'Open sans', sans-serif;
  font-size: 0.9rem;
  font-weight: 600;
  line-height: 1.45rem;
  margin-top: 1rem;
  margin-bottom: 0;
}

.product-card-desc {
  color: #8a8a8a;
  display: block;
  font-family: 'Open sans', sans-serif;
  font-size: 0.85rem;
}

.product-card-price {
  color: #3e3e3e;
  display: inline-block;
  font-size: 0.85rem;
  font-weight: 600;
  margin-top: 0.8rem;
}

.product-card-sale {
  color: #cacaca;
  display: inline-block;
  font-size: 0.85rem;
  margin-left: 0.3rem;
  text-decoration: line-through;
}

.product-card-colors {
  display: block;
  margin-top: 0.8rem;
}

.product-card-color-option {
  display: inline-block;
  height: 25px;
  width: 25px;
}

</style>
</head>
<c:import url="header.jsp" />
<body>
	<div class="main" style="margin: 10% 10%;">
	<!-- prduct Card start -->
	<c:forEach items="${pbList}" var="b" varStatus="i">
	<c:if test="${i.index%4 == 0 || i.first}">
		<div class="row">
	</c:if>
	<div class="column">
		<div class="product-card">
			<div class="product-card-thumbnail">				
				<a href="proboard/product.do?pbno=${b.pbno}">
				<img src="${pageContext.request.contextPath}/resources/upload/${b.category1}/${b.category2}/${b.category3}/${b.pname}/1.JPG" 
				width="180" height="180"/></a>
			</div>
			<h2 class="product-card-title">
				<a href="proboard/product.do?pbno=${b.pbno}"">${b.title}</a>
			</h2>
			<span class="product-card-desc">${b.pname}</span> 
			<span class="product-card-price"><fmt:formatNumber value="${b.price}" type="currency" currencySymbol="￦"/></span>
			<span class="product-card-sale"><fmt:formatNumber value="${b.event}" type="currency" currencySymbol="￦"/></span>		
		</div>
	</div>
	<c:if test="${i.index%4 == 3 || i.last}">
		</div>
	</c:if>
	</c:forEach>
	<!-- prduct Card end -->
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
<c:import url="footer.jsp" />

</html>