<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>qna page</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.qnaList:hover{
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

	 function checkQnaDetail(qno) {
		
		var qlist = new Array();
		
		<c:forEach var="qna" items="${qlist}">
			var qna = new Object();
			qna.qno = "${qna.qno}";
			qna.category = "${qna.category}";
			qna.writer = "${qna.writer}";
			qna.content = "${qna.content}";
			qna.path = "${qna.path}";
			qna.qdate = "${qna.qdate}";
			qna.status = "${qna.status}";
			qlist.push(qna);
		</c:forEach>
		
		var qna = new Object();

		for(var i=0; i<qlist.length; i++){
			if(qlist[i].qno*1 == qno){
				qna = qlist[i];
				break;				
			}
		}
		
		$("#detailCategory").html(qna.category);
		$("#detailStatus").html(qna.status);
		$("#detailQnaWriter").html(qna.writer);
		$("#detailQnaDate").html(qna.qdate);
		$("#detailQnaContent").html(qna.content);
		$("#qnaQno").val(qna.qno);
		console.log("qnaQno : "+ $("#qnaQno").val());
		$.ajax({
			type: "POST",
			url: "../review/getImgs.do",
			data : {'path' : qna.path},
			success : function(data){
				
				if(data.length > 0){
					var imgstr = "";
					var indicator = "";
					/* 
					var btn = "<a class=\"carousel-control-prev\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"prev\">";
					btn += "<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>";
					btn += "<span class=\"sr-only\">이전</span></a>";
				  
					btn += "<a class=\"carousel-control-next\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"next\">";
					btn += "<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>";
					btn += "<span class=\"sr-only\">다음</span></a>";
					 */
					for(var i=0; i<data.length; i++){
						if(i==0){
							
							indicator += "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+i+"\" class=\"active\"></li>";

							imgstr += "<div class=\"carousel-item active\">";
							imgstr += "<img class=\"d-block w-100\" src=\"${pageContext.request.contextPath}"+qna.path+"/"+data[i]+"\" width='100' alt=\""+(i+1)+"번째 슬라이드\"></div>";
						}else{
							
							indicator += "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\""+i+"\"></li>";

						    imgstr += "<div class=\"carousel-item\">";
							imgstr += "<img class=\"d-block w-100\" src=\"${pageContext.request.contextPath}"+qna.path+"/"+data[i]+"\" width='100' alt=\""+(i+1)+"번째 슬라이드\"></div>";				
						}	
					}
					console.log("imgstr check : " + imgstr);
					$("#detailQnaIndicators").html(indicator);
					$("#detailQnaImgs").html(imgstr);
					//$("#controlbtn").html(btn);
				}
			}
		})	
		qnaList(qna.qno);
	} 


	function qnaWirte() {
		var content = $("#qnacontent").val();
		
		if(content == "" || content == null){
			swal("내용을 입력해주세요!", "리뷰 정보가 저장되지 않습니다.", "warning");
			return;
		}	
		
		$("#qnacontent").val(content.replace(/(?:\r\n|\r|\n)/g, '<br />'));
		
		document.qna.submit();
	}	
	
	function qnaReplyWirte() {
		var content = $("#qnaReplyWirteContent").val();
		
		if(content == "" || content == null){
			swal("내용을 입력해주세요!", "", "warning");
			return;
		}	
		
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');	
		var qno = $("#qnaQno").val();
		
		$.ajax({
			type: "POST",
			url: "../reply/replyWirte.do",
			data : {'qno' : qno, 'content' : content},
			success : function(){
				$("#qnaReplyWirteContent").val("");
				qnaList(qno);		
			}
		})	
	}
	
	function qnaList(qno){
		$.ajax({
			type: "POST",
			url: "../reply/reply.do",
			data : {'qno' : qno, 'flag' : 'qna'},
			success : function(data){
				var rplist = JSON.parse(data);
				console.log("rplist:"+data+"/ list length : "+rplist.length);
				var str = "";
				for(var i=0; i<rplist.length; i++){
					str += "<tr><td>"+rplist[i].writer+"</td>";
					str += "<td>"+rplist[i].content+"</td>";
					str += "<td>"+rplist[i].rpdate+"</td></tr>";
				}
				$("#qnaReplyList").html(str);
			}
		})
	}
	
	
</script>

</head>
<body>
	<table>
		<tr>
			<th>문의유형</th> <th>상 태</th> <th>질 문 자</th> <th>내용</th> <th>작성 날짜</th>
		</tr>
		<c:choose>
	    	<c:when test="${empty qlist}">
	    		<tr>
				    <td class='tcon pdt9b6l5' height=30 colspan=8 align=center>대상건이 존재하지 않습니다.</td>
				</tr>
	    	</c:when>
    		<c:otherwise>
    			<c:forEach var="qna" items="${qlist}">
					<tr class = "qnaList"  onclick="checkQnaDetail(${qna.qno})" data-target="#qnaDetailPop" data-toggle="modal">
						<td>${qna.category}</td>
						<td>${qna.status}</td>
						<td>${qna.writer}</td>
						<td>${qna.content}</td>
						<td>${qna.qdate}</td>
					</tr>
				</c:forEach>
    		</c:otherwise>
    	</c:choose>	 	
	</table>
	
	<input type="button" data-target="#qnaWritePop" data-toggle="modal" value="문의하기">
	
	
	<div class="modal fade" id="qnaWritePop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">문의하기</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">	 
	      	<form name="qna"  method="post" action="../review/qnaWirte.do" enctype="multipart/form-data">  		
	      		<input type="hidden" name="pbno" value="${pbno}">
	      		<input type="hidden" name="path" value="${pbno}${proboard.title}/">
	      		<table>
	      			<tr>
	      				<td>문의사항</td>
	      				<td>
	      					<select id="selectCategory" name="category" style="width:300pt; display: inline;">
	      						<option value="상품" selected>상품</option>
								<option value="배송">배송</option>
								<option value="반품/취소">반품/취소</option>
								<option value="교환/변경">교환/변경</option>
								<option value="기타">기타</option>
	      					</select>
						</td>
	      			</tr>
	      			<tr>
	      				<td>첨부파일</td>
	      				<td><input multiple="multiple" type="file" name="file" /></td>
	      			</tr>
	      			<tr>
	      				<td>내용</td>
	      				<td><textarea id="qnacontent" name="content" rows="2" required></textarea></td>
	      			</tr>	      		
	      		</table>
      		</form>   
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="qnaWirte()">작성 완료</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<div class="modal fade" id="qnaDetailPop" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- header title -->
	        <h4 class="modal-title">문의 상세</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">	   
	      		<table>
	      		<!-- <th>문의유형</th> <th>상 태</th> <th>질 문 자</th> <th>내용</th> <th>작성 날짜</th> -->
	      			<tr>
	      				<td>문의유형</td>
	      				<td id="detailCategory"></td>
	      			</tr>
	      			<tr>
	      				<td>상 태</td>
	      				<td id="detailStatus"></td>
	      			</tr>
	      			<tr>
	      				<td>작 성 자</td>
	      				<td id="detailQnaWriter"></td>
	      			</tr>
	      			<tr>
	      				<td>날 짜</td>
	      				<td id="detailQnaDate"></td>
	      			</tr>
	      			<tr>
	      				<td>내 용</td>
	      				<td>	      				
	      					<!-- 카로셀 들어갈 자리 -->
							<div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
							  <ol class="carousel-indicators" id="detailQnaIndicators">		    
							  </ol>
							  <div class="carousel-inner" id="detailQnaImgs"></div>
							  
							  <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">이전</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">다음</span>
							  </a>

							</div>	
							<!-- 카로셀 끝 -->
	      					<br><br>
	      					<span id="detailQnaContent"></span>
	      				</td>
	      			</tr>	      		
	      		</table>
	      		<hr>
	      		<table>
	      			<thead>
		      			<tr>
		      				<th>댓글 작성자</th> <th>댓글 내용</th> <th>날 짜</th>
		      			</tr>
	      			</thead>
	      			<tbody id="qnaReplyList">
	      				
	      			</tbody>
	      		</table>
				<input id="qnaQno" type="hidden" name="qno" value="">
		 		<textarea id="qnaReplyWirteContent" name="content" cols="60" rows=3 placeholder="댓글" required></textarea>&nbsp;
		 	 	<input type="button" class="btn btn-success" onclick="qnaReplyWirte()" value="댓글작성">
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

</body>
</html>



