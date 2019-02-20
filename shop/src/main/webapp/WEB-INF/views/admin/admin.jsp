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
</head>

<body>
  <c:import url="adminNav.jsp"/>
      <div class="off-canvas-content" data-off-canvas-content>
        <div class="title-bar hide-for-large">
          <div class="title-bar-left">
            <button class="menu-icon" type="button" data-open="my-info"></button>
            <span class="title-bar-title">Mike Mikerson</span>
          </div>
        </div>
        <div class="callout primary">
          <div class="row column">
            <h1>안녕? 관리자 페이지 입니다.</h1>
            <p class="lead">너희들의 월급만큼 일해라</p>
          </div>
        </div>
        <div class="row column">
          <h1>server down -> you down</h1>
        </div>
        <hr>


      </div>
    </div>
  </div>
  <script src="../resources/js/vendor/jquery.js"></script>
  <script src="../resources/js/vendor/foundation.js"></script>
  <script src="../resources/js/app.js"></script>
</body>

</html>