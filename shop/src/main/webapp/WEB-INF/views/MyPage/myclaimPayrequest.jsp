<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/반품/교환 현황</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myorder.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-stars.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.paylist:hover{
		cursor: pointer;
		background-color: #FFBBBB;
	}
	.prlist:hover{
		background-color: #FFBBBB;
	}
</style>


<script>
	var prlist;

	$(function() {
		prlist = new Array();
		<c:forEach var="pr" items="${prlist}">
			var json = new Object();
			json.reqno = "${pr.reqno}"
			json.pbno = "${pr.pbno}"
			json.path = "${pr.path}"
			json.title = "${pr.title}"	
			json.options = "${pr.options}"
			prlist.push(json);
		</c:forEach>
		
	});
	
	function reviewRequest(reqno) {
		var preq = new Object();
		for(var i=0; i<prlist.length; i++){
			if(reqno == prlist[i].reqno){
				preq = prlist[i];
				break;
			}
		}

		$("#hiddenpbno").val(preq.pbno);
		$("#hiddenpath").val(preq.pbno+preq.title+"/");
		$("#hiddenoptions").val(preq.options);
		$("#selectOption").html(preq.options);
	}
	
	function reviewWirte() {
		var content = $("#content").val();
		
		if(content == "" || content == null){
			swal("내용을 입력해주세요!", "리뷰 정보가 저장되지 않습니다.", "warning");
			return;
		}	
		
		 $("#content").val(content.replace(/(?:\r\n|\r|\n)/g, '<br />'));
		
		document.review.submit();
	}
	
</script>

</head>

<body>
	
	<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
		<col width="40"><col width="80"><col width="20"><col width="30"><col width="30"><col width="40"><col width="40">
			<thead>
				<tr class="tb_myPgThB mgt15">
					<th colspan="2" style="text-align:center;">상품명</th>
					<th style="text-align:center;">수 량</th>
					<th style="text-align:center;">가 격</th>
					<th style="text-align:center;">합 계</th>
					<th style="text-align:center;">주문현황</th>
					<th style="text-align:center;">&nbsp;</th>
				</tr>
			</thead>
			
			
			<c:choose>
		    	<c:when test="${empty prlist}">
		    		<tr>
					    <td class='tcon pdt9b6l5' height=30 colspan=7 align=center>대상건이 존재하지 않습니다.</td>
					</tr>
		    	</c:when>
	    		<c:otherwise>   
	    		  <c:forEach var="pr" items="${prlist}">
		          	<tr class="prlist" style="text-align:center;">
		          		<td>
		          		<a href="../proboard/product.do?pbno=${pr.pbno}">
		          			<img src="${pageContext.request.contextPath}${pr.path}/메인.jpg" width="120"><br><br>
		          			상품 게시글 보기
		          		</a>
		          		</td>
		          		<td>${pr.pname}<br><strong>${pr.options}</strong></td>
		          		<td>${pr.count}</td>
		          		<td>${pr.price}</td>
		          		<td>${pr.count * pr.price}</td>
		          		<td>${pr.status}</td>
		          		<td><input type="button" class="hollow button" onclick="reviewRequest(${pr.reqno})" data-target="#reviewWritePop" data-toggle="modal" value="리뷰 작성"></td>
		          	</tr>
		          </c:forEach> 
		    	</c:otherwise>
	    	</c:choose>
	</table>	
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
              <li><a class="pagination-pointed-button" href="myclaim.do?pagePr=${index}&tabs=payrequest&todate=${todate}&fromdate=${fromdate}" aria-label="Page ${index}">${index}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>        
        <li class="pagination-next disabled">Next
            <span class="show-for-sr">page</span></li>
      </ul>
    <!-- pageing template -->	
				
	<div class="modal fade" id="reviewWritePop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">리뷰 남기기</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">	 
	      	<form name="review"  method="post" action="reviewWriteInMyclaim.do" enctype="multipart/form-data">  		
	      		<input type="hidden" id="hiddenpbno" name="pbno" value="">
	      		<input type="hidden" id="hiddenpath" name="path" value="">
	      		<input type="hidden" id="hiddenoptions" name="options" value="">
	      		<table>
	      			<tr>
	      				<td>구매한 옵션</td>
	      				<td id="selectOption"></td>
	      			</tr>
	      			<tr>
	      				<td>별 점</td>
	      				<td>
	      					 <select id="selectStars" name="stars">
							   <option value="1">1</option>
							   <option value="2">2</option>
							   <option value="3">3</option>
							   <option value="4">4</option>
							   <option value="5">5</option>  
							 </select>
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>첨부파일</td>
	      				<td><input multiple="multiple" type="file" name="file" /></td>
	      			</tr>
	      			<tr>
	      				<td>내용</td>
	      				<td><textarea id="content" name="content" rows="2" required></textarea></td>
	      			</tr>	      		
	      		</table>
      		</form>   
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="hollow button success" data-dismiss="modal" onclick="reviewWirte()">작성 완료</button>
	        <button type="button" class="hollow button alert" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function() {
	    $('#selectStars').barrating({
	      theme: 'fontawesome-stars'
	    });
	  });
</script>
</body>
</html>