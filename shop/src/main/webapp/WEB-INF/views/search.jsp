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
    /* 제품 카드 css */

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

    /* 검색조건 필터 css */

    .product-filters {
      padding: 0.5rem 1.5rem;
      background-color: #fefefe;
      margin-top: 2.5rem;
    }

    .product-filters label {
      color: #8a8a8a;
    }

    .product-filters .menu.nested {
      margin-left: 0rem;
      margin-bottom: 0.9rem;
    }

    .product-filters .menu>li>a {
      padding-left: 0;
      color: #4a4a4a;
      font-size: 0.85rem;
      font-weight: 600;
    }

    .product-filters .is-accordion-submenu-parent>a::after {
      border-color: #cacaca transparent transparent;
    }

    .product-filters .clear-all {
      font-size: 0.9rem;
      color: #cacaca;
    }

    .product-filters .more {
      color: #1779ba;
      font-size: 0.9rem;
      cursor: pointer;
    }

    .product-filters-header {
      font-size: 1.25rem;
      padding-top: 0.5rem;
    }

    .product-filters-tab {
      border-top: 1px solid #e6e6e6;
    }

    .product-filters-tab:last-child() {
      border-bottom: 1px solid #e6e6e6;
    }

    .mobile-product-filters {
      border-bottom: 1px solid #e6e6e6;
    }
  </style>
</head>
<c:import url="header.jsp" />

<body>
  <div class="main" style="margin: 10% 10%; width: 100%">
    <div class="row">
      <!-- product filter start -->
      <div class="large-4 small-12 columns">
        <div class="hide-for-small panel">
          <div class="product-filters">
            <ul class="mobile-product-filters vertical menu show-for-small-only" data-accordion-menu>
              <li>
                <a href="#">
                  <h2>Products</h2>
                </a>
                <ul class="vertical menu" data-accordion-menu>
                  <li class="product-filters-tab">
                    <a href="#">Category</a>
                    <ul class="categories-menu menu vertical nested is-active">
                      <a href="#" class="clear-all" id="category-clear-all">Clear All</a>
                      <li><input class="category-clear-selection" id="category-checkbox1" type="checkbox"><label for="category-checkbox1">Category
                          1</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox2" type="checkbox"><label for="category-checkbox2">Category
                          2</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox3" type="checkbox"><label for="category-checkbox3">Category
                          3</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox4" type="checkbox"><label for="category-checkbox4">Category
                          4</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox5" type="checkbox"><label for="category-checkbox5">Category
                          5</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox6" type="checkbox"><label for="category-checkbox6">Category
                          6</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox7" type="checkbox"><label for="category-checkbox7">Category
                          7</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox8" type="checkbox"><label for="category-checkbox8">Category
                          8</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox9" type="checkbox"><label for="category-checkbox9">Category
                          9</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox10" type="checkbox"><label for="category-checkbox10">Category
                          10</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox11" type="checkbox"><label for="category-checkbox11">Category
                          11</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox12" type="checkbox"><label for="category-checkbox12">Category
                          12</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox13" type="checkbox"><label for="category-checkbox13">Category
                          13</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox14" type="checkbox"><label for="category-checkbox14">Category
                          14</label></li>
                      <li><input class="category-clear-selection" id="category-checkbox15" type="checkbox"><label for="category-checkbox15">Category
                          15</label></li>
                    </ul>
                  </li>
                  <li class="product-filters-tab">
                    <a href="#">Size</a>
                    <ul class="categories-menu menu vertical nested is-active">
                      <a href="#" class="clear-all" id="size-clear-all">Clear All</a>
                      <li><input id="size-checkbox1" type="checkbox"><label for="size-checkbox1">Small</label></li>
                      <li><input id="size-checkbox2" type="checkbox"><label for="size-checkbox2">Medium</label></li>
                      <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">Large</label></li>
                      <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">X-Large</label></li>
                      <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">XX-Large</label></li>
                    </ul>

                  </li>
                  <li class="product-filters-tab">
                    <a href="#">Color</a>
                    <ul class="categories-menu menu vertical nested">
                      <a href="#" class="clear-all" id="color-clear-all">Clear All</a>
                      <li><input id="color-checkbox1" type="checkbox"><label for="color-checkbox1">All Color</label></li>
                      <li><input id="color-checkbox2" type="checkbox"><label for="color-checkbox2">Black</label></li>
                      <li><input id="color-checkbox3" type="checkbox"><label for="color-checkbox3">White</label></li>
                      <li><input id="color-checkbox4" type="checkbox"><label for="color-checkbox4">Grey</label></li>
                      <li><input id="color-checkbox5" type="checkbox"><label for="color-checkbox5">Red</label></li>
                      <li><input id="color-checkbox6" type="checkbox"><label for="color-checkbox6">Blue</label></li>
                      <li><input id="color-checkbox7" type="checkbox"><label for="color-checkbox7">Green</label></li>
                      <li><input id="color-checkbox8" type="checkbox"><label for="color-checkbox8">Purple</label></li>
                      <li><input id="color-checkbox8" type="checkbox"><label for="color-checkbox8">Multi-color</label></li>
                    </ul>
                  </li>
                  <li class="product-filters-tab">
                    <a href="#">Price</a>
                    <ul class="categories-menu menu vertical nested">
                      <a href="#" class="clear-all" id="price-clear-all">Clear All</a>
                      <li><input id="price-checkbox1" type="checkbox"><label for="price-checkbox1">Under $25</label></li>
                      <li><input id="price-checkbox2" type="checkbox"><label for="price-checkbox2">$25–$50</label></li>
                      <li><input id="price-checkbox3" type="checkbox"><label for="price-checkbox3">$50–$250</label></li>
                      <li><input id="price-checkbox4" type="checkbox"><label for="price-checkbox4">$250–$600</label></li>
                      <li><input id="price-checkbox4" type="checkbox"><label for="price-checkbox4">$600–$1,000</label></li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>

            <h1 class="product-filters-header hide-for-small-only">Products</h1>
            <ul class="vertical menu hide-for-small-only" data-accordion-menu>
              <li class="product-filters-tab">
                <a href="#">Category</a>
                <ul class="categories-menu menu vertical nested is-active">
                  <a href="#" class="clear-all" id="category-clear-all">Clear All</a>
                  <li><input id="category-checkbox1" type="checkbox"><label for="category-checkbox1">Category 1</label></li>
                  <li><input id="category-checkbox2" type="checkbox"><label for="category-checkbox2">Category 2</label></li>
                  <li><input id="category-checkbox3" type="checkbox"><label for="category-checkbox3">Category 3</label></li>
                  <li><input id="category-checkbox4" type="checkbox"><label for="category-checkbox4">Category 4</label></li>
                  <li><input id="category-checkbox5" type="checkbox"><label for="category-checkbox5">Category 5</label></li>
                  <li><input id="category-checkbox6" type="checkbox"><label for="category-checkbox6">Category 6</label></li>
                  <li><input id="category-checkbox7" type="checkbox"><label for="category-checkbox7">Category 7</label></li>
                  <li><input id="category-checkbox8" type="checkbox"><label for="category-checkbox8">Category 8</label></li>
                  <li><input id="category-checkbox9" type="checkbox"><label for="category-checkbox9">Category 9</label></li>
                  <li><input id="category-checkbox10" type="checkbox"><label for="category-checkbox10">Category 10</label></li>
                  <li><input id="category-checkbox11" type="checkbox"><label for="category-checkbox11">Category 11</label></li>
                  <li><input id="category-checkbox12" type="checkbox"><label for="category-checkbox12">Category 12</label></li>
                  <li><input id="category-checkbox13" type="checkbox"><label for="category-checkbox13">Category 13</label></li>
                  <li><input id="category-checkbox14" type="checkbox"><label for="category-checkbox14">Category 14</label></li>
                  <li><input id="category-checkbox15" type="checkbox"><label for="category-checkbox15">Category 15</label></li>
                </ul>
              </li>
              <li class="product-filters-tab">
                <a href="#">Size</a>
                <ul class="categories-menu menu vertical nested is-active">
                  <a href="#" class="clear-all" id="size-clear-all">Clear All</a>
                  <li><input id="size-checkbox1" type="checkbox"><label for="size-checkbox1">Small</label></li>
                  <li><input id="size-checkbox2" type="checkbox"><label for="size-checkbox2">Medium</label></li>
                  <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">Large</label></li>
                  <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">X-Large</label></li>
                  <li><input id="size-checkbox3" type="checkbox"><label for="size-checkbox3">XX-Large</label></li>
                </ul>
              </li>
              <li class="product-filters-tab">
                <a href="#">Color</a>
                <ul class="categories-menu menu vertical nested">
                  <a href="#" class="clear-all" id="color-clear-all">Clear All</a>
                  <li><input id="color-checkbox1" type="checkbox"><label for="color-checkbox1">All Color</label></li>
                  <li><input id="color-checkbox2" type="checkbox"><label for="color-checkbox2">Black</label></li>
                  <li><input id="color-checkbox3" type="checkbox"><label for="color-checkbox3">White</label></li>
                  <li><input id="color-checkbox4" type="checkbox"><label for="color-checkbox4">Grey</label></li>
                  <li><input id="color-checkbox5" type="checkbox"><label for="color-checkbox5">Red</label></li>
                  <li><input id="color-checkbox6" type="checkbox"><label for="color-checkbox6">Blue</label></li>
                  <li><input id="color-checkbox7" type="checkbox"><label for="color-checkbox7">Green</label></li>
                  <li><input id="color-checkbox8" type="checkbox"><label for="color-checkbox8">Purple</label></li>
                  <li><input id="color-checkbox8" type="checkbox"><label for="color-checkbox8">Multi-color</label></li>
                </ul>
              </li>
              <li class="product-filters-tab">
                <a href="#">Price</a>
                <ul class="categories-menu menu vertical nested">
                  <a href="#" class="clear-all" id="price-clear-all">Clear All</a>
                  <li><input id="price-checkbox1" type="checkbox"><label for="price-checkbox1">Under $25</label></li>
                  <li><input id="price-checkbox2" type="checkbox"><label for="price-checkbox2">$25–$50</label></li>
                  <li><input id="price-checkbox3" type="checkbox"><label for="price-checkbox3">$50–$250</label></li>
                  <li><input id="price-checkbox4" type="checkbox"><label for="price-checkbox4">$250–$600</label></li>
                  <li><input id="price-checkbox4" type="checkbox"><label for="price-checkbox4">$600–$1,000</label></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- product filter end -->
      <!-- product Card start -->

      <div class="large-8 columns">
        <c:forEach items="${pbList}" var="b" varStatus="i">
          <c:if test="${i.index%4 == 0 || i.first}">
            <div class="row">
          </c:if>
          <div class="large-4 columns">
            <div class="product-card">
              <div class="product-card-thumbnail">
                <a href="proboard/product.do?pbno=${b.pbno}">
                  <img src="${pageContext.request.contextPath}/resources/upload/${b.category1}/${b.category2}/${b.category3}/${b.pname}/1.JPG"
                    width="180" height="180" /></a>
              </div>
              <h2 class="product-card-title">
                <a href="proboard/product.do?pbno=${b.pbno}"">${b.title}</a>
			</h2>
			<span class="
                  product-card-desc">${b.pname}</span>
                  <span class="product-card-price">
                    <fmt:formatNumber value="${b.price}" type="currency" currencySymbol="￦" /></span>
                  <span class="product-card-sale">
                    <fmt:formatNumber value="${b.event}" type="currency" currencySymbol="￦" /></span>
            </div>
          </div>
          <c:if test="${i.index%4 == 3 || i.last}">
      </div>
      </c:if>
      </c:forEach>
      <!-- prduct Card end -->
    </div>
  </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
  <script type="text/javascript">
    //More (Expand) or Less (Collapse)
    $('.categories-menu.menu.nested').each(function () {
      var filterAmount = $(this).find('li').length;
      if (filterAmount > 5) {
        $('li', this).eq(4).nextAll().hide().addClass('toggleable');
        $(this).append('<li class="more">More</li>');
      }
    });

    $('.categories-menu.menu.nested').on('click', '.more', function () {
      if ($(this).hasClass('less')) {
        $(this).text('More').removeClass('less');
      } else {
        $(this).text('Less').addClass('less');
      }
      $(this).siblings('li.toggleable').slideToggle();
    });
  </script>
</body>
<c:import url="footer.jsp" />

</html>