<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>관리자 페이지 - 메인페이지 수정</title>
	<link rel="stylesheet" href="../resources/css/foundation.css">
	<style type="text/css">
		.table-expand {
			margin-top: 2rem;
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

		@ -webkit-keyframes fadeIn {
			from {
				opacity: 0;

			}

			to {
				opacity: 1;
			}

		}

		@ keyframes fadeIn {
			from {
				opacity: 0;

			}

			to {
				opacity: 1;
			}
		}
	</style>
	</style>
</head>

<body>
	<c:import url="adminNav.jsp"/>
	<c:set var="ctx" property="${pageContext.request.contextPath}"/>
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
				<form name="caroselIMG" action="mainUpdate.do" method="post" enctype="multipart/form-data">
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 1:</label> <input type="file" class="button warning expanded" name="file1" />
						</p>
					</div>
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 2:</label> <input type="file" class="button warning expanded" name="file2" />
						</p>
					</div>
					<div class="column large-4 medium-4 small-4">
						<p>
							<label>카로셀 이미지 3:</label> <input type="file" class="button warning expanded" name="file3" />
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
				<c:if test="${not empty elist}">
					<table class="table-expand stack hover">
						<thead>
							<tr>
								<th width="200px">태그</th>
								<th width="250px">제목</th>
								<th width="250px">내용</th>
								<th width="8px">x/y</th>
								<th width="8px">bNo.</th>
								<th width="8px">표시</th>
								<th width="6px">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${elist}" var="elist">
								<tr class="table-expand-row" data-open-details>
									<td>${elist.tag}</td>
									<td><a href="${ctx}/${elist.link}">${elist.etitle}</a></td>
									<td>${elist.escript}</td>
									<td>${elist.xpath}/${elist.ypath}</td>
									<td>${elist.pbno}</td>
									<td><c:if test="${elist.flag == 1}">On</c:if>
										<c:if test="${elist.flag == 0}">Off</c:if></td>
									<td><a href="mainEventDelete.do?eno=${elist.eno}" method="post">삭제</a></td>
								</tr>
								<tr class="table-expand-row-content">
									<form action="mainEventChange.do" method="post">
									<input type="hidden" name="eno" value="${elist.eno}">
									<td>수정내용 : </td>
									<td class="table-expand-row">
										<label>제목</label>
										<input type="text" name ="etitle" value="${elist.etitle}">
									</td>
									<td class="table-expand-row">
										<label>내용</label>
										<input type="text" name ="escript" value="${elist.escript}"></td>
									<td class="table-expand-row">
										<label>X</label>
										<input type="text" name ="xpath" value="${elist.xpath}">
									</td>
									<td class="table-expand-row">
										<label>Y</label>
										<input type="text" name ="ypath" value="${elist.ypath}">
									</td>
									<td class="table-expand-row">
										<label>flag</label>
										<input type="text" name ="flag" value="${elist.flag}">
									</td>
									<td>
										<input type="submit" value="수정">
									</td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				</div>
				<div class="row column">
				<form action="mainEventEdit.do" method="post">
					<label for="tag"><b>이벤트태그구분자:</b>
						<c:forEach items="${tlist}" var="tlist">[ ${tlist.tag}
						<a id="updateEventTagOn" onclick="updateTagOn('${tlist.tag}')" >On</a>
						<a id="updateEventTagOff" onclick="updateTagOff('${tlist.tag}')">Off</a>
						 ]</c:forEach>
					</label>
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
							<option value="${list.pbno}">${list.category3}-${list.title}</option>
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
					<div class="row">
						<div class="columns large-1">
							<span class="switch">
								<label for="flag0">OFF</label>
								<input class="switch-input" id="flag0" type="radio" checked name="flag" value="0">
								<label class="switch-paddle" for="flag0">
									<span class="show-for-sr">0</span>
								</label>
							</span>
						</div>
						<div class="columns large-1 end">
							<span class="switch">
								<label for="flag1">ON</label>
								<input class="switch-input" id="flag1" type="radio" name="flag" value="1">
								<label class="switch-paddle" for="flag1">
									<span class="show-for-sr">1</span>
								</label>
							</span>
						</div>
					</div>
					<hr>
					<input class="alert button large-down-expanded" type="reset" value="취소">
					<input class="sucssess button large-down-expanded" type="submit" value="등록">
				</form>
			</div>
		</div>
	</div>
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('[data-open-details]').click(function (e) {
			e.preventDefault();
			$(this).next().toggleClass('is-active');
			$(this).toggleClass('is-active');
		});
		function change2() {
			var selected = $(".proboardSelect option:selected").val(); 
			<c:forEach var = "list" items = "${list}">
				if (selected == "${list.pbno}") {
					$("#etitle").attr("value", "${list.title}");
					$("#pbno").attr("value", "${list.pbno}");
					$("#pbno").attr("readonly", true);
					$("#imgpath").attr("value", "${list.path}");
					$("#link").attr("value", "proboard/product.do?pbno=${list.pbno}");
				} 
			</c:forEach>
		}
		function updateTagOn(tag){
			swal("["+tag+"]를 일괄 표시 하시겠습니까 ?", {
				  buttons: ["취소", true],
			}).then((value)=>{
				if(value == true){		
					$.ajax({
						type:"POST",
						url:"updateTagOn.do",
						data : {'tag' : tag },
						success : function(data){
							if(data == true){
								swal('변경되었습니다.')
								.then((value) =>{
									location.reload();
								});
							}else{
								swal('에러','에러가 발생하였습니다.','error')
								.then((value) =>{
									location.reload();
								});
							}
						}
					});
				}
			});
		}
		function updateTagOff(tag){
			swal("["+tag+"]를 일괄 비표시 하시겠습니까 ?", {
				  buttons: ["취소", true],
			}).then((value)=>{
				if(value == true){		
					$.ajax({
						type:"POST",
						url:"updateTagOff.do",
						data : {'tag' : tag },
						success : function(data){
							if(data == true){
								swal('변경되었습니다.')
								.then((value) =>{
									location.reload();
								});
							}else{
								swal('에러','에러가 발생하였습니다.','error')
								.then((value) =>{
									location.reload();
								});
							}
						}
					});
				}
			});
		}
	</script>
</body>

</html>