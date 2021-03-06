<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 Q&A</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myorder.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.qnalist:hover{
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



<script>
	var todate;
	var fromdate;

	$(function() {
		if( "${paging.todate}" == "" ||  "${paging.todate}" == null){
			var date = new Date(); 
			var year = date.getFullYear(); 
			var month = new String(date.getMonth()+1); 
			var day = new String(date.getDate()); 
		
			if(month.length == 1){ 
			  month = "0" + month; 
			} 
			if(day.length == 1){ 
			  day = "0" + day; 
			}
		
			todate = year+"-"+month+"-"+day;
			fromdate = year+"-"+month+"-"+day;
			
			$('input[name="daterange"]').daterangepicker({
				  showDropdowns: true,
				  endDate: moment().startOf('hour'),
				  maxDate: moment().startOf('hour'),
				  locale: {
				      format: 'YYYY-MM-DD'
				    }
			  }, function(start, end, label) {
			    todate = start.format('YYYY-MM-DD');
			    fromdate = end.format('YYYY-MM-DD');
			  });
		}else{
			todate = "${paging.todate}";
			fromdate = "${paging.fromdate}";
			
			$('input[name="daterange"]').daterangepicker({
				  showDropdowns: true,
				  startDate : todate,
				  endDate: fromdate,
				  maxDate: moment().startOf('hour'),
				  locale: {
				      format: 'YYYY-MM-DD'
				    }
			  }, function(start, end, label) {
			    todate = start.format('YYYY-MM-DD');
			    fromdate = end.format('YYYY-MM-DD');
			  });
		}
		
	  
	});
	
	function searchDate(){
		location.href = "myqna.do?todate="+todate+"&fromdate="+fromdate;
	}
	
	function checkDetail(qno) {
		
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
					str += "<td id=\"qnaReplyContent"+rplist[i].rpno+"\">"+rplist[i].content+"</td>";
					str += "<td>"+rplist[i].rpdate+"</td>";
					if("${session}" == rplist[i].writer){
						str += "<td id=\"qbt"+rplist[i].rpno+"\"><input type=\"button\" class=\"btn btn-info\" onclick=\"qnaReplyEdit("+rplist[i].rpno+","+qno+")\" value=\"수정\">&nbsp;";
						str += "<input type=\"button\" class=\"btn btn-danger\" onclick=\"qnaReplyDelete("+rplist[i].rpno+","+qno+")\" value=\"삭제\"></td></tr>";
					}else{
						str += "<td>&nbsp;</td></tr>";
					}
				}
				$("#qnaReplyList").html(str);
			}
		})
	}
	
	function qnaReplyEdit(rpno, qno, content) {
		$("#qnaReplyContent"+rpno).html(
		  "<input type='text' id='edit"+rpno+"' value='' required>"	
		);
		$("#qbt"+rpno).html(
			"<input type='button' class='btn btn-success' onclick=\"qnaEditSave("+rpno+","+qno+")\" value='완료'>&nbsp;"+
			"<input type='button' class='btn btn-danger' onclick=\"qnaList("+qno+")\" value='취소'>"
		);
	}
	
	function qnaEditSave(rpno, qno) {
		var content = $("#edit"+rpno).val();
		$.ajax({
			type: "POST",
			url: "../reply/replyEdit.do",
			data : {'rpno' : rpno, 'content' : content},
			success : function(){
				qnaList(qno);	
			}
		})
	}
	
	function qnaReplyDelete(rpno, qno) {
		$.ajax({
			type: "POST",
			url: "../reply/replyDelete.do",
			data : {'rpno' : rpno},
			success : function(){
				qnaList(qno);	
			}
		})
	}
	
	
</script>



</head>
<c:import url="../header.jsp" />
<body>
	<div class="row column">
	<nav aria-label="You are here:" role="navigation">
        <ul class="breadcrumbs mypageSectorArea">
          <li><a href="myorder.do" style="font-weight:900; font-size:x-large;">주문/배송현황</a></li>
          <li><a href="myclaim.do" style="font-weight:900; font-size:x-large;">취소/반품/교환 현황</a></li>
          <li><a href="myreview.do" style="font-weight:900; font-size:x-large;">내 상품 리뷰</a></li>
          <li style="font-weight:900; font-size:x-large; color: #da6464" class="disabled">내 Q&A</li>
        </ul>
      </nav> 
	
	<div class="MPright_area">
		<!-- <div class="mypageSectorArea">
		    <h1 style="font-weight:900">마이페이지-내 Q&A</h1>
		</div> -->
	
		<div class="h3WithAd">
			<h3 class="mgb10">
				<div class="txt">내 문의사항 현황을 확인할 수 있습니다.</div>
			</h3>
		</div>
		<div class="row column end">	
		<form name="OrderSearchListForm" method="get" action="refer.do">
			<div class="cmtbox">
				<table cellspacing="0" cellpadding="0" class="tb_checkingPeriod">
					<tr>
						<th class="item">조회기간</th>
						<td class="con">
							<div class="previousDetailsWrap">
								<input type="text" id="daterange" name="daterange" style="width:240px" value="" />							
							</div>
						</td>
						<td class="buttonWrap">
							<a href="#" class="periodButton" onclick="searchDate()"><em style="font-size:20pt">조회하기</em></a>							
						</td>
						<td class="buttonWrap">
							<a href="myqna.do" class="periodButton"><em style="font-size:20pt">전체보기</em></a>
						</td>
					</tr>
				</table>
			</div>
			<div class="cmtbox_bot"></div>
		</form>
		</div>
	</div>
	</div>
	
	<div class="row column">
		
			<div class="media-object-section" style="text-align: center;">
				<table cellspacing="0" cellpadding="0" width="785" class="tb_myPg02">
					<col width="40"><col width="70"><col width="70"><col width="50">
						<thead>
							<tr class="tb_myPgThB mgt15">
								<th style="text-align:center;">게시글</th>
								<th style="text-align:center;">문의유형</th>
								<th style="text-align:center;">상 태</th>
								<th style="text-align:center;">작성날짜</th>
							</tr>						
						</thead>
						<c:choose>
					    	<c:when test="${empty qlist}">
					    		<tr>
								    <td class='tcon pdt9b6l5' height=30 colspan=4 align=center>대상건이 존재하지 않습니다.</td>
								</tr>
					    	</c:when>
				    		<c:otherwise>   
				    		  <c:forEach var="qna" items="${qlist}">
					          	<tr class="qnalist">
					          		<td>
						          		<c:choose>
						          			<c:when test="${qna.title == '' || empty qna.title}">
							          			<img src="${pageContext.request.contextPath}/resources/image/noimg.jpg" width="120" ><br><br>
							          			판매글이 존재하지 않습니다.
						          			</c:when>
						          			<c:otherwise>
						          				<a href="../proboard/product.do?pbno=${qna.pbno}">
								          			<img src="${pageContext.request.contextPath}/resources/upload/${qna.pbno}/${qna.title}/메인.jpg" width="120"><br><br>
								          			상품 게시글 보기
								          		</a>
						          			</c:otherwise>
						          		</c:choose>      		
					          		</td>
					          		<td onclick="checkDetail(${qna.qno})" data-target="#qnaDetailPop" data-toggle="modal">${qna.category}</td>
					          		<td onclick="checkDetail(${qna.qno})" data-target="#qnaDetailPop" data-toggle="modal">${qna.status}</td>
					          		<td onclick="checkDetail(${qna.qno})" data-target="#qnaDetailPop" data-toggle="modal">${qna.qdate}</td>				          		
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
			              <li><a class="pagination-pointed-button" href="myqna.do?page=${index}&todate=${paging.todate}&fromdate=${paging.fromdate}" aria-label="Page ${index}">${index}</a></li>
			            </c:otherwise>
			          </c:choose>
			        </c:forEach>        
			        <li class="pagination-next disabled">Next
			            <span class="show-for-sr">page</span></li>
			      </ul>
			    <!-- pageing template --> 	
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
		      				<th>댓글 작성자</th> <th>댓글 내용</th> <th>날 짜</th> <th>&nbsp;</th>
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



<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
<c:import url="../footer.jsp" />
</html>
