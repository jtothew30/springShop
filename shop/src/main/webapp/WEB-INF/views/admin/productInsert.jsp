<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    margin-left: 0; } }
@media screen and (min-width: 40em) and (max-width: 63.9375em) {
  .button.medium-only-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
@media screen and (max-width: 63.9375em) {
  .button.medium-down-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
@media print, screen and (min-width: 40em) {
  .button.medium-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
@media screen and (min-width: 64em) and (max-width: 74.9375em) {
  .button.large-only-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
@media screen and (max-width: 74.9375em) {
  .button.large-down-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
@media print, screen and (min-width: 64em) {
  .button.large-expanded {
    display: block;
    width: 100%;
    margin-right: 0;
    margin-left: 0; } }
    </style>
</head>

<body>	
	<c:import url="adminNav.jsp"/> 
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
        <div class="row column">
        <form name="productInsertForm" action="productInsert.do" method="post">
          <p>제품명:<input name="pname" type="text"> </p>
          </div>
          <p>제조사명:<input name="brand" type="text"> </p>
          <div class="row column">
          <p>입고가격:<input name="inprice" type="text"> </p>
          </div>
          <div class="row column">
          <p>판매가격:<input name="outprice" type="text"> </p>
           </div>
          <div class="row column">
          <p>카테고리1:<input name="category1" type="text"> </p>
           </div>
          <div class="row column">
          <p>카테고리2:<input name="category2" type="text"> </p>
           </div>
          <div class="row column">
          <p>카테고리3:<input name="category3" type="text"> </p>
           </div>
          <div class="row column">
          <p>옵션:<input name="options" type="text"> </p>
           </div>
          <div class="row column">
          <p>부가설명:<textarea name="script" rows="3"></textarea> </p>
           </div>
         
          <input type="hidden" name="sales" value="0">
                    
          <div class="row column"  >
			  <div class="large-1 column">1</div>
			  <div class="large-10 large-offset-1 column" >10, offset 1</div>
		  </div>
        </div>
         
        <div class="row column">
        	<input class="alert button large-down-expanded" type="reset" value="취소" >
        	<input class="sucssess button large-down-expanded" type="submit" value="등록">
         </div>
          </form>
        <hr>
      </div>
    
  <script src="../resources/js/vendor/jquery.js"></script>
  <script src="../resources/js/vendor/foundation.js"></script>
  <script src="../resources/js/app.js"></script>
</body>

</html>