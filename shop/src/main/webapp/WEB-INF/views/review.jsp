<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>review page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* var prolist;
	
	$(function(){
		prolist = new Array();
		<c:forEach var="pro" items="${prolist}">
			var json = new Object();
			json.pno = "${pro.pno}";
			json.options = "${pro.options}";
			prolist.push(json);
		</c:forEach>	
	}) */
	
	function reviewWirte() {
		var content = $("#content").val();
		
		if(content == "" || content == null){
			swal("내용을 입력해주세요!", "리뷰 정보가 저장되지 않습니다.", "warning");
			return;
		}
		
		
		document.review.submit();
	}
	
	
</script>

</head>
<body>
	<table>
		<tr>
			<th>리뷰 작성자</th> <th>내용</th> <th>별점</th> <th>작성 날짜</th>
		</tr>		
	</table>
	
	<input type="button" data-target="#reviewWritePop" data-toggle="modal" value="리뷰 작성">
	
	
	
	
	
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
	      	<form name="review"  method="post" action="../review/reviewWirte.do" enctype="multipart/form-data">  		
	      		<input type="hidden" name="pbno" value="${pbno}">
	      		<input type="hidden" name="path" value="${pbno}${proboard.title}">
	      		<table>
	      			<tr>
	      				<td>구매한 옵션</td>
	      				<td>
	      					<select id="selectOption" name="options" style="width:300pt; display: inline;">
	      						<option value="없음" selected>옵션 선택</option>
								<c:forEach var="op" items="${prolist}">
									<option value="${op.options}">${op.options}</option>
								</c:forEach>
	      					</select>
						</td>
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
	        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reviewWirte()">작성 완료</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
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



