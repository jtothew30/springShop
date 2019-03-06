<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 페이지 - 메인페이지 수정</title>
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
		<div class="callout primary">
			<div class="row column">
				<h1>메인페이지 수정 페이지</h1>
				<p class="lead">배고프다</p>
			</div>
		</div>
		<div class="callout primary">
			<div class="row column">
				<form name="caroselIMG" action="mainUpdate.do" method="post"
					enctype="multipart/form-data">
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 1:</label> <input type="file"
								class="button warning expanded" name="file1" />
						</p>
					</div>
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 2:</label> <input type="file"
								class="button warning expanded" name="file2" />
						</p>
					</div>
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 3:</label> <input type="file"
								class="button warning expanded" name="file3" />
						</p>
					</div>
			</div>
			<div class="row column">
				&nbsp;
				<input class="alert button large-down-expanded" type="reset" value="취소">
				<input class="sucssess button large-down-expanded" type="submit" value="등록">
			</div>
			</form>
		</div>
		<div class="callout primary">
			<div class="row column">
			<form action="mainEventEdit.do" method="post">
				<label for="tag"><b>이벤트태그구분자:</b></label>
				<input type="text" name="tag">
				<hr>
				<div class="row">
				<div class="columns large-6">
					<label for="xpath">화면노출 x좌표</label>
					<div class="row">
					<div class="columns large-3">
					<span class="switch">
					  <label for="xpath-1">1</label>
					  <input class="switch-input" id="xpath-1" type="radio" checked name="xpath" value="1">
					  <label class="switch-paddle" for="xpath-1">
					  <span class="show-for-sr">1</span>
					  </label>
					</span>				
					</div>
					<div class="columns large-3">
					<span class="switch">
					  <label for="xpath-2">2</label>
					  <input class="switch-input" id="xpath-2" type="radio" name="xpath" value="2">
					  <label class="switch-paddle" for="xpath-2">
					  <span class="show-for-sr">2</span>
					  </label>
					</span>
					</div>			
					<div class="columns large-3 end">	
					<span class="switch">
					  <label for="xpath-3">3</label>
					  <input class="switch-input" id="xpath-3" type="radio" name="xpath" value="3">
					  <label class="switch-paddle" for="xpath-3">
					  <span class="show-for-sr">3</span>
					  </label>
					</span>
					</div>
					</div>
					</div>
				
					<div class="columns large-6">
					<label for="xpath">화면노출 y좌표</label>
					<div class="row">
					<div class="columns large-3">
					<span class="switch">
					  <label for="ypath-1">1</label>
					  <input class="switch-input" id="ypath-1" type="radio" checked name="ypath" value="1">
					  <label class="switch-paddle" for="ypath-1">
					  <span class="show-for-sr">1</span>
					  </label>
					</span>	
					</div>		
					<div class="columns large-3 end">	
					<span class="switch">
					  <label for="ypath-2">2</label>
					  <input class="switch-input" id="ypath-2" type="radio" name="ypath" value="2">
					  <label class="switch-paddle" for="ypath-2">
					  <span class="show-for-sr">3</span>
					  </label>
					</span>
					</div>
					</div>
					</div>
				</div>
				<hr>		
				 <label for="proboardSelect">판매글 선택</label>
				<select class="proboardSelect" onchange="change2();">
					<option>---판매글선택---</option>
				<c:forEach items="${list}" var="list">
					<option value="${list.pbno}">${list.title}</option>
				</c:forEach>				
				</select>
				<hr>
				  <label for="etitle">표기 title</label>
				<input id="etitle" type="text" name="etitle">
				<label for="escript">표기 script</label>
				<input id="escript" type="text" name="escript">
				<hr>
				pbno:<input id="pbno" type="text" name="pbno">
				imgpath:<input id="imgpath" type="text" name="imgpath">
				link:<input id="link" type="text" name="link">
				<br>
				flag:<input id="flag" type="text" name="flag">
				<input class="alert button large-down-expanded" type="reset" value="취소"> 
				<input class="sucssess button large-down-expanded" type="submit" value="등록">
			</form>
			</div>
		</div>
		
		<div class="callout primary">
			<div class="row column">
			
			</div>
		</div>
	</div>
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
	function change2() {
		var selected = $(".proboardSelect option:selected").val();		
		<c:forEach var="list" items="${list}">
		if(selected == "${list.pbno}"){
			$("#etitle").attr("value","${list.title}");			
			$("#pbno").attr("value","${list.pbno}");
			$("#pbno").attr("readonly",true);
			$("#imgpath").attr("value","${list.path}");
			$("#link").attr("value","proboard/prduct.do?pbno=${list.pbno}");
		}
		</c:forEach>
	}
	</script>
</body>

</html>