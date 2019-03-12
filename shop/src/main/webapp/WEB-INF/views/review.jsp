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

<style type="text/css">
	.reviewList:hover{
		cursor: pointer;
		background-color: #FFBBBB;
	}
	
	.carousel-item{
		min-height: 500px;
	}
	
	.carousel-item img{
		position: absolute;
		top:0;
		left:0;
		width:100%;
		
	}
</style>



<script type="text/javascript">	

	function checkDetail(rno) {
		
		var rlist = new Array();
		
		<c:forEach var="review" items="${rlist}">
			var review = new Object();
			review.rno = "${review.rno}";
			review.options = "${review.options}";
			review.writer = "${review.writer}";
			review.content = "${review.content}";
			review.path = "${review.path}";
			review.stars = "${review.stars}";
			review.rdate = "${review.rdate}";
			review.good = "${review.good}";
			review.bad = "${review.bad}";
			rlist.push(review);
		</c:forEach>
		
		var review = new Object();

		for(var i=0; i<rlist.length; i++){
			if(rlist[i].rno*1 == rno){
				review = rlist[i];
				break;				
			}
		}
		
		$("#detailWriter").html(review.writer);
		$("#detailOptions").html(review.options);
		$("#detailDate").html(review.rdate);
		$("#detailContent").html(review.content);
		$("#reviewRno").val(review.rno);
		$.ajax({
			type: "POST",
			url: "../review/getImgs.do",
			data : {'path' : review.path},
			success : function(data){
				var imgstr = "";
				var indicator = "";
				for(var i=0; i<data.length; i++){
					if(i==0){
						
						indicator += "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+i+"\" class=\"active\"></li>";

						imgstr += "<div class=\"carousel-item active\">";
						imgstr += "<img class=\"d-block w-100\" src=\"${pageContext.request.contextPath}"+review.path+"/"+data[i]+"\" width='100' alt=\""+(i+1)+"번째 슬라이드\"></div>";
					}else{
						
						indicator += "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+i+"\"></li>";

					    imgstr += "<div class=\"carousel-item\">";
						imgstr += "<img class=\"d-block w-100\" src=\"${pageContext.request.contextPath}"+review.path+"/"+data[i]+"\" width='100' alt=\""+(i+1)+"번째 슬라이드\"></div>";				
					}	
				}
				$("#detailIndicators").html(indicator);
				$("#detailImgs").html(imgstr);
			}
		})		
		
		
		var starsstr = "";
		
		for(var i=1; i<=5; i++){
			if(review.stars*1 == i){
				starsstr += "<option value=\""+i+"\" selected>"+i+"</option>";
			}else
				starsstr += "<option value=\""+i+"\">"+i+"</option>";
		}
		
		$("#detailStars").html(starsstr);
		setStars();
		reviewList(review.rno);
	}

	function setStars() {
		$('#detailStars').barrating('destroy'); 
		$('#detailStars').barrating({
		      theme: 'fontawesome-stars',
		      readonly: 'true'
		    });
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
	
	function pushReact(rno, react) {
		
		$.ajax({
			type: "POST",
			url: "../review/reactCheck.do",
			data : {'rno' : rno},
			success : function(data){
				if(data == true){
					$.ajax({
						type: "POST",
						url: "../review/react.do",
						data : {'rno' : rno, 'react' : react},
						success : function(data){
							if(react == 'good'){
								$("#clickgood"+rno).html(data);
							}else{
								$("#clickbad"+rno).html(data);
							}			
						}
					})
				}else{
					swal("이미 선택하셨습니다.");
				}			
			}
		})		
	}
	
	
	function reviewReplyWirte() {
		var content = $("#reviewReplyWirteContent").val();
		
		if(content == "" || content == null){
			swal("내용을 입력해주세요!", "", "warning");
			return;
		}	
		
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');	
		var rno = $("#reviewRno").val();
		
		$.ajax({
			type: "POST",
			url: "../reply/replyWirte.do",
			data : {'rno' : rno, 'content' : content},
			success : function(){
				$("#reviewReplyWirteContent").val("");
				reviewList(rno);		
			}
		})	
	}
	
	function reviewList(rno){
		$.ajax({
			type: "POST",
			url: "../reply/reply.do",
			data : {'rno' : rno, 'flag' : 'review'},
			success : function(data){
				var rplist = JSON.parse(data);
				var str = "";
				for(var i=0; i<rplist.length; i++){
					str += "<tr><td>"+rplist[i].writer+"</td>";
					str += "<td id=\"reviewReplyContent"+rplist[i].rpno+"\">"+rplist[i].content+"</td>";
					str += "<td>"+rplist[i].rpdate+"</td>";
					if("${session}" == rplist[i].writer){
						str += "<td id=\"rbt"+rplist[i].rpno+"\"><input type=\"button\" class=\"btn btn-info\" onclick=\"reviewReplyEdit("+rplist[i].rpno+","+rno+")\" value=\"수정\">&nbsp;";
						str += "<input type=\"button\" class=\"btn btn-danger\" onclick=\"reviewReplyDelete("+rplist[i].rpno+","+rno+")\" value=\"삭제\"></td></tr>";						
					}else{
						str += "<td>&nbsp;</td></tr>";
					}
				}
				$("#reviewReplyList").html(str);
			}
		})
	}
	
	function reviewReplyEdit(rpno, rno, content) {
		$("#reviewReplyContent"+rpno).html(
		  "<input type='text' id='edit"+rpno+"' value='' required>"	
		);
		$("#rbt"+rpno).html(
			"<input type='button' class='btn btn-success' onclick=\"reviewEditSave("+rpno+","+rno+")\" value='완료'>&nbsp;"+
			"<input type='button' class='btn btn-danger' onclick=\"reviewList("+rno+")\" value='취소'>"
		);
	}
	
	function reviewEditSave(rpno, rno) {
		var content = $("#edit"+rpno).val();
		$.ajax({
			type: "POST",
			url: "../reply/replyEdit.do",
			data : {'rpno' : rpno, 'content' : content},
			success : function(){
				reviewList(rno);
			}
		})
	}
	
	function reviewReplyDelete(rpno, rno) {
		$.ajax({
			type: "POST",
			url: "../reply/replyDelete.do",
			data : {'rpno' : rpno},
			success : function(){
				reviewList(rno);
			}
		})
	}
	
</script>

</head>
<body>
	<table>
		<tr>
			<th>별점</th> <th>리뷰 작성자</th> <th>내용</th> <th>작성 날짜</th> <th>고객 공감도</th>
		</tr>
		<c:choose>
	    	<c:when test="${empty rlist}">
	    		<tr>
				    <td class='tcon pdt9b6l5' height=30 colspan=8 align=center>대상건이 존재하지 않습니다.</td>
				</tr>
	    	</c:when>
    		<c:otherwise>
    			<c:forEach var="review" items="${rlist}">
					<tr class = "reviewList">
						<td onclick="checkDetail(${review.rno})"  data-target="#reviewDetailPop" data-toggle="modal">				
							<select class="reviewStars">
							   <option value="1" <c:if test="${review.stars == 1}">selected</c:if>>1</option>
							   <option value="2" <c:if test="${review.stars == 2}">selected</c:if>>2</option>
							   <option value="3" <c:if test="${review.stars == 3}">selected</c:if>>3</option>
							   <option value="4" <c:if test="${review.stars == 4}">selected</c:if>>4</option>
							   <option value="5" <c:if test="${review.stars == 5}">selected</c:if>>5</option>  
							 </select>		
							 <br>
						</td>
						<td onclick="checkDetail(${review.rno})"  data-target="#reviewDetailPop" data-toggle="modal">${review.writer}</td>
						<td onclick="checkDetail(${review.rno})"  data-target="#reviewDetailPop" data-toggle="modal">${review.content}</td>
						<td onclick="checkDetail(${review.rno})"  data-target="#reviewDetailPop" data-toggle="modal">${review.rdate}</td>
						<td>
							<img src="${pageContext.request.contextPath}/resources/image/good.png">공감해요 - <a href="javascript:;" id="clickgood${review.rno}" onclick="pushReact(${review.rno}, 'good')">${review.good}</a>&nbsp;&nbsp;
							<img src="${pageContext.request.contextPath}/resources/image/bad.png">별로에요 - <a href="javascript:;" id="clickbad${review.rno}" onclick="pushReact(${review.rno}, 'bad')">${review.bad}</a>
						</td>
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
              <li><a class="pagination-pointed-button" id="paging-focus" href="../proboard/product.do?pbno=${pbno}&pageR=${index}&tabs=review" aria-label="Page ${index}">${index}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>        
        <li class="pagination-next disabled">Next
            <span class="show-for-sr">page</span></li>
      </ul>
    <!-- pageing template -->
	
	<button type="button" class="btn btn-success" data-target="#reviewWritePop" data-toggle="modal">리뷰 작성</button>
	
	
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
	      		<input type="hidden" name="path" value="${pbno}${proboard.title}/">
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
	        <button type="button" class="hollow button success" data-dismiss="modal" onclick="reviewWirte()">작성 완료</button>
	        <button type="button" class="hollow button alert" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<div class="modal fade" id="reviewDetailPop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">리뷰 상세</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">	 
	      		<table>
	      			<tr>
	      				<td>작 성 자</td>
	      				<td id="detailWriter"></td>
	      			</tr>
	      			<tr>
	      				<td>옵 션</td>
	      				<td id="detailOptions"></td>
	      			</tr>
	      			<tr>
	      				<td>날 짜</td>
	      				<td id="detailDate"></td>
	      			</tr>
	      			<tr>
	      				<td>별 점</td>
	      				<td>
	      					 <select id="detailStars"></select>
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>내 용</td>
	      				<td>	      				
	      					<!-- 카로셀 들어갈 자리 -->
							<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							  <ol class="carousel-indicators" id="detailIndicators">
							    
							  </ol>
							  <div class="carousel-inner" id="detailImgs">
							    
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">이전</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">다음</span>
							  </a>
							</div>	
							<!-- 카로셀 끝 -->
	      					<br><br>
	      					<span id="detailContent"></span>
	      				</td>
	      			</tr>      		
	      		</table>
	      		<hr>
	      		<table>
	      			<thead>
		      			<tr>
		      				<th>댓글 작성자</th> <th>댓글 내용</th> <th>날 짜</th> <th>&nbsp;</th>
		      			</tr>
	      			</thead>
	      			<tbody id="reviewReplyList">
	      				
	      			</tbody>
	      		</table>
				<input id="reviewRno" type="hidden" name="rno" value="">
		 		<textarea id="reviewReplyWirteContent" name="content" cols="60" rows=3 placeholder="댓글" required></textarea>&nbsp;
		 	 	<input type="button" class="btn btn-success" onclick="reviewReplyWirte()" value="댓글작성">

	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
	
	$(function() {
	    $('.reviewStars').barrating({
	      theme: 'fontawesome-stars',
	      readonly: 'true'
	    });
	  });
</script>

</body>
</html>



