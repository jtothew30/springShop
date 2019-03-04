<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>관리자페이지-판매글관리</title>
	<link rel="stylesheet" href="../resources/css/foundation.css">
	<style type="text/css">
		.table-expand {
			margin-top: 2rem;
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
						<form action="boardList.do">
						<input name="kwd" type="text" placeholder="검색키워드" value="${paging.kwd}">
					</div>
					<div class="small-6 columns">
						<input type="submit" class="button postfix" value="Go">
						</form>
					</div>
				</div>
			</div>
				<div class="columns">
					<table class="table-expand stack">
						<thead>
							<tr>
								<th>pbno</th>
								<th>img</th>
								<th>title</th>
								<th>pbdate</th>
								<th>price</th>
								<th>event</th>
								<th>totalsales</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.pbno}</td>
									<td><img src="${pageContext.request.contextPath}${list.path}/1.jpg" width="100" height="100"></td>
									<td><a href="../proboard/product.do?pbno=${list.pbno}">${list.title}</a></td>
									<td>${list.pbdate}</td>
									<td>${list.price}</td>
									<td>${list.event}</td>
									<td>${list.totalsales}</td>
									<td>
										<input class="button secondery" type="button" value="수정" onclick="location.href='boardEdit.do?pbno=${list.pbno}'">
										<input class="button alert" type="button" value="삭제" onclick="location.href='boardDelete.do?pbno=${list.pbno}'">
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
              <li><a class="pagination-pointed-button" href="boardList.do?page=${index}" aria-label="Page ${index}">${index}</a></li>
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
		</script>
</body>

</html>