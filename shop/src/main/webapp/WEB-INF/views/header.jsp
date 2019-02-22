<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Header</title>
	<link rel="stylesheet" href="resources/css/foundation.css"> 
	<link rel="stylesheet" href="resources/css/app.css"> 	
	<link rel="stylesheet" href="resources/foundation-icons/foundation-icons.css">	
</head>

		
	<!-- NOTE: This is the off-canvas menu that appears when you click on the hamburger menu on smaller screens. Everything in the `.off-canvas` div belongs in `src/layouts/default.html`. Copy this section into the `default.html` file and remove it from this file.  -->
<div class="off-canvas ecommerce-header-off-canvas position-left" id="ecommerce-header" data-off-canvas>

  <!-- Close button -->
  <button class="close-button" aria-label="Close menu" type="button" data-close>
    <span aria-hidden="true">&times;</span>
  </button>

  <ul class="vertical menu">
    <li class="main-nav-link"><a href="categories.html">Category 1</a></li>
    <li class="main-nav-link"><a href="#">Category 2</a></li>
    <li class="main-nav-link"><a href="why.html">Category 3</a></li>
    <li class="main-nav-link"><a href="build.html">Category 4</a></li>
    <li class="main-nav-link"><a href="#">Category 5</a></li>
  </ul>

  <hr>

  <!-- Menu -->
  <ul class="menu vertical">
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
    <li><a href="#">장바구니</a></li>
    <li><a href="#">마이페이지</a></li>
  </ul>

</div>

<!-- NOTE: This is the header menu that appears at the top of your site. -->
<div class="off-canvas-content" data-off-canvas-content>
  <div class="ecommerce-header-top show-for-large" style="border-spacing: 3em;">
    <div class="row align-justify">
      <div class="ecommerce-header-top-message medium-horizontal">
        <h5><img src="resources/foundation-icons/svgs/fi-shopping-cart.svg" height="30" width="30">온라인 쇼핑몰 KG쇼핑</h5>
      </div>
      <div class="ecommerce-header-top-links">
        <ul align="right ">
          <li><a href="#">로그인</a></li>
          <li><a href="#">회원가입</a></li>
          <li><a href="#">장바구니</a></li>
          <li><a href="#">마이페이지</a></li>
          <li><a href="#" target="_blank"><i class="fa fa-shopping-cart"></i></a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="ecommerce-header show-for-large">
    <div class="row">
      <div class="shrink column">
        <ul class="vertical medium-horizontal menu">
          <li><a href="#"><img class="logo" src="https://placehold.it/160x50"></a></li>
          <li class="main-nav-link"><a href="categories.html">Category 1</a></li>
          <li class="main-nav-link"><a href="#">Category 2</a></li>
          <li class="main-nav-link"><a href="why.html">Category 3</a></li>
          <li class="main-nav-link"><a href="build.html">Category 4</a></li>
          <li class="main-nav-link"><a href="#">Category 5</a></li>
          <li class="divider">&nbsp;</li>
          <li class="has-form" style="margin-left:15px; margin-top: 15px;">
			  <div class="row collapse">
			    <div class="large-8 small-9 columns">
			      <input type="text" placeholder="Find Stuff">
			    </div>
			  </div>
		  </li>
		  <li class="divider">&nbsp;</li>
		  <li style="margin-left:15px; margin-top: 15px;">
			  <div class="large-4 small-3 columns">
			      <a href="#" class="alert button expand">Search</a>
			  </div>
		  </li>
        </ul>
      </div>
    </div>
  </div>

  <div class="ecommerce-header-mobile hide-for-large">
    <div class="ecommerce-header-mobile-left">
      <button class="menu-icon" type="button" data-toggle="ecommerce-header"></button>
      <form class="ecommerce-header-search-exandable">
        <input type="search" placeholder="Search">
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