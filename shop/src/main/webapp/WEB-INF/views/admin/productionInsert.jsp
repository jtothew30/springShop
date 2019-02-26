<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>

      <div class="off-canvas position-left reveal-for-large" id="my-info" data-off-canvas data-position="left">
        <div class="row column">
          <br>
          <object type="image/svg+xml" data="../resources/foundation-icons/svgs/fi-address-book.svg">아이콘</object>
          <h5>관리자 페이지</h5>
          <p> 야 관리 똑바로 해라</p>
        </div>
        <div class="row small-up-2 medium-up-3 large-up-4">
          <div class="column">
            <a href="productInsert.do">
              <img src="../resources/foundation-icons/svgs/fi-plus.svg" height="65" width="68"><b>상품등록페이지</b>
            </a>
          </div>
          <div class="column">
            <a href="#">
              <img src="../resources/foundation-icons/svgs/fi-page-export.svg" height="65" width="68"><b>상품판매글 등록</b>
            </a>
          </div>
          <div class="column">
            <a href="#">
              <img src="../resources/foundation-icons/svgs/fi-graph-bar.svg" height="65" width="68"><b>이용자 통계</b>
            </a>
          </div>          
          <div class="column">
            <a href="#">
              <img src="../resources/foundation-icons/svgs/fi-price-tag.svg" height="65" width="68"><b>메인 광고 설정</b>
            </a>
          </div>
          <div class="column">
            <a href="#">
              <img src="../resources/foundation-icons/svgs/fi-price-tag.svg" height="65" width="68"><b>Best상품 배너 설정</b>
            </a>
          </div>
          <div class="column">
            <a href="#">
              <img src="../resources/foundation-icons/svgs/fi-price-tag.svg" height="65" width="68"><b>할인 중 상품 설정</b>
            </a>
          </div>
        </div>
      </div>

      <div class="off-canvas-content" data-off-canvas-content>
        <div class="title-bar hide-for-large">
          <div class="title-bar-left">
            <button class="menu-icon" type="button" data-open="my-info"></button>
            <span class="title-bar-title">Mike Mikerson</span>
          </div>
        </div>
        <div class="callout primary">
          <div class="row column">
            <h1>안녕? 제품등록 페이지 입니다.</h1>
            <p class="lead">너희들의 월급만큼 일해라</p>
          </div>
        </div>
        <div class="column lead">
          <p>제품명:<input name="pname" type="text"> </p>
          <p>제조사명:<input name="brand" type="text"> </p>
          <p>입고가격:<input name="inprice" type="text"> </p>
          <p>판매가격:<input name="outprice" type="text"> </p>
          <p>카테고리1:<input name="category1" type="text"> </p>
          <p>카테고리2:<input name="category2" type="text"> </p>
          <p>카테고리3:<input name="category3" type="text"> </p>
          <p>옵션:<input name="option" type="text"> </p>
          <p>부가설명:<textarea name="script"></textarea> </p>
          <input type="hidden" name="sales" value="0">
        </div>
        <input class="alert button large-down-expanded" type="reset" value="취소" >
        <input class="sucssess button large-down-expanded" type="submit" value="등록">
        <hr>
      </div>
    </div>
  </div>
  <script src="../resources/js/vendor/jquery.js"></script>
  <script src="../resources/js/vendor/foundation.js"></script>
  <script src="../resources/js/app.js"></script>
</body>

</html>