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
		<div class="row" style="padding-top: 4em; padding-bottom: 0rm; margin-bottom: 0px;">
			<div class="large-5 columns">
				<div class="row collapse postfix-round">
					<div class="small-6 columns">
						<form action="productList.do">						 
						<input name="kwd" type="text" placeholder="검색키워드" value="${paging.kwd}">
					</div>
					<div class="small-6 columns">
						<input type="submit" class="button postfix" value="Go">
						</form>
					</div>
				</div>
			</div>		
			<div class="columns">
				<table class="table-expand stack hover">
					<thead>
						<tr>
							<th>pno</th>
							<th>pname</th>
							<th>brand</th>
							<th>inprice</th>
							<th>outprice</th>
							<th>cate1</th>
							<th>cate2</th>
							<th>cate3</th>
							<th>options</th>
							<th>script</th>
							<th>sales</th>
							<th>count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr class="table-expand-row" data-open-details>
								<td>${list.pno}</td>
								<td>${list.pname}</td>
								<td>${list.brand}</td>
								<td>${list.inprice}</td>
								<td>${list.outprice}</td>
								<td>${list.category1}</td>
								<td>${list.category2}</td>
								<td>${list.category3}</td>
								<td>${list.options}</td>
								<td>${list.script}</td>
								<td>${list.sales}</td>
								<c:choose>
									<c:when test="${list.count eq 0}">
										<td bgcolor="#c60f13">
											<font color="white">${list.count}</font><span class="expand-icon"></span>
										</td>
									</c:when>
									<c:otherwise>
										<td bgcolor="#5da423">
											<font color="white">${list.count}</font><span class="expand-icon"></span>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="table-expand-row-content">
								<td colspan="2" class="table-expand-row">
									<div class="colunms">
										<form action="proCountUpdate.do" method="post">
											<div class="colunms">
												<input id="pno" type="hidden" name="pno" value="${list.pno}">
												현 재고량 : <input id="count" type="text" name="count" value="${list.count}">
											</div>
									</div>
								</td>
								<td colspan="1" class="table-expand-row">
									<div class="colunms" style="padding-top: 1em;">
										<input onclick="countUpdate();" class="button" value="재고수정">
									</div>
									</form>
								</td>
								<td colspan="2" class="table-expand-row">
									<div class="colunms end">
										<div class="large-4" style="padding-top: 1em;">
											<form action="insertNewOption.do" method="post">
												<input type="hidden" name="pno" value="${list.pno}">
												<input type="submit" class="success button" value="옵션 추가 등록">
											</form>
										</div>
									</div>
								</td>
								<td colspan="1" class="table-expand-row">
									<div class="colunms large-4 end">
										<div class="large-4" style="padding-top: 1em;">
											<form action="updateProduction.do" method="post">
												<input type="hidden" name="pno" value="${list.pno}">
												<input type="submit" class="button" value="제품 수정">
											</form>
										</div>
									</div>
								</td>
								<td colspan="6" class="table-expand-row end">
									<div class="colunms large-4 end">
										<div class="large-4" style="padding-top: 1em;">
											<form action="deleteProduction.do" method="post">
												<input type="hidden" name="pno" value="${list.pno}">
												<input type="submit" class="alert button" value="제품 삭제">
											</form>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- pageing template -->
      <ul class="pagination-pointed pagination text-center" role="navigation" aria-label="Pagination">        
        <li class="pagination-previous disabled">Previous
			<span class="show-for-sr">page</span></li>
        <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
          <c:choose>
            <c:when test="${paging.page==index}">
              <li class="current"><span class="show-for-sr">You're on page</span> ${index}</li>
            </c:when>
            <c:otherwise>
              <li><a class="pagination-pointed-button" href="productList.do?page=${index}" aria-label="Page ${index}">${index}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>        
        <li class="pagination-next disabled">Next
            <span class="show-for-sr">page</span></li>
      </ul>
      <!-- pageing template -->
	<script src="../resources/js/vendor/jquery.js"></script>
	<script src="../resources/js/vendor/foundation.js"></script>
	<script src="../resources/js/app.js"></script>
	<script type="text/javascript">
		$('[data-open-details]').click(function (e) {
			e.preventDefault();
			$(this).next().toggleClass('is-active');
			$(this).toggleClass('is-active');
		});		
		$(document).ready(function(){
			var prev = '<c:out value="${paging.prev}"/>';
			var next = '<c:out value="${paging.next}"/>';
			if(prev == 'true'){
				$(".pagination-previous").removeClass("disabled");
				$(".pagination-previous").html(" <a class='pagination-pointed-top' href='${paging.beginPage-10}'"
						+"aria-label='Next page'>Previous <span class='show-for-sr'>page</span></a>");
			}
			if(next == 'true'){
				$(".pagination-next").removeClass("disabled");
				$(".pagination-next").html( "<a class='pagination-pointed-button' href='${paging.endPage+1}'"
						+"aria-label='Next page'>Next<span class='show-for-sr'>page</span></a>");
			}
		});
		function countUpdate(){
			var count = $("#count").val();
			var pno = $("#pno").val();
			$.ajax({
				type: "POST",
				url: "proCountUpdateAjax.do",
				data : {'pno':pno, "count": count},
				success : function(){
					location.reload();
				}
			});
		}
	</script>
</body>

</html>