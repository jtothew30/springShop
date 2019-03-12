<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품리뷰</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myorder.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-stars.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	.reviewlist:hover{
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
		location.href = "myreview.do?todate="+todate+"&fromdate="+fromdate;
	}
	
	
function checkDetail(rno) {
		
		var rlist = new Array();
		
		<c:forEach var="review" items="${rvlist}">
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
		console.log("reviewRno : "+ $("#reviewRno").val());
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
	
	
	
	function deleteReview(rno) {
		swal("해당 리뷰를 삭제하시겠습니까?", "","warning",  {
			  buttons: {				    
			    catch: {
			      text: "삭제하기",
			      value: "catch",
			    },
			    cancel: "취소",
			  },
			})
			.then((value) => {
			  switch (value) {					 
			    case "catch":
			    	$.ajax({
						type: "POST",
						url: "deleteReview.do",
						data : {'rno' : rno},
						success : function(){
							swal("삭제가 완료됐습니다.","","success")
							.then((value) => {
								location.reload();
							});							
						}
					})		    	
			      break;					 
			    default:
			    	break;
			  }
			});
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
          <li style="font-weight:900; font-size:x-large; color: #da6464" class="disabled">내 상품 리뷰</li>
          <li><a href="myqna.do" style="font-weight:900; font-size:x-large;">내 Q&A</a></li>
        </ul>
      </nav> 
	
	<div class="MPright_area">
	<!-- 	<div class="mypageSectorArea">
		    <h1 style="font-weight:900">마이페이지-내 상품 리뷰</h1>
		</div> -->
	
		<div class="h3WithAd">
			<h3 class="mgb10">
				<div class="txt">내 상품 리뷰의 현황 확인 및 관리가 가능합니다.</div>
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
								<input type="text" name="daterange" style="width:240px" value="" />							
							</div>
						</td>
						<td class="buttonWrap">
							<a href="#" class="periodButton" onclick="searchDate()"><em style="font-size:20pt">조회하기</em></a>							
						</td>
						<td class="buttonWrap">
							<a href="myreview.do" class="periodButton"><em style="font-size:20pt">전체보기</em></a>
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
				<col width="40"><col width="40"><col width="80"><col width="50"><col width="30">
					<thead>
						<tr class="tb_myPgThB mgt15">
							<th style="text-align:center;">게시글</th>
							<th style="text-align:center;">별 점</th>
							<th style="text-align:center;">고객 공감도</th>
							<th style="text-align:center;">작성날짜</th>
							<th>&nbsp;</th>
						</tr>						
					</thead>
					<c:choose>
				    	<c:when test="${empty rvlist}">
				    		<tr>
							    <td class='tcon pdt9b6l5' height=30 colspan=5 align=center>대상건이 존재하지 않습니다.</td>
							</tr>
				    	</c:when>
			    		<c:otherwise>   
			    		  <c:forEach var="review" items="${rvlist}">
				          	<tr class="reviewlist">
				          		<td>
					          		<a href="../proboard/product.do?pbno=${review.pbno}">
					          			<img src="${pageContext.request.contextPath}/resources/upload/${review.pbno}/${review.title}/메인.jpg" width="120"><br><br>
					          			상품 게시글 보기
					          		</a>
				          		</td>
				          		<td onclick="checkDetail(${review.rno})" data-target="#reviewDetailPop" data-toggle="modal">
				          			<select class="reviewStars">
									   <option value="1" <c:if test="${review.stars == 1}">selected</c:if>>1</option>
									   <option value="2" <c:if test="${review.stars == 2}">selected</c:if>>2</option>
									   <option value="3" <c:if test="${review.stars == 3}">selected</c:if>>3</option>
									   <option value="4" <c:if test="${review.stars == 4}">selected</c:if>>4</option>
									   <option value="5" <c:if test="${review.stars == 5}">selected</c:if>>5</option>  
									 </select>
				          		</td>
				          		<td onclick="checkDetail(${review.rno})" data-target="#reviewDetailPop" data-toggle="modal">
									<img src="${pageContext.request.contextPath}/resources/image/good.png">공감해요 - ${review.good}&nbsp;&nbsp;
									<img src="${pageContext.request.contextPath}/resources/image/bad.png">별로에요 - ${review.bad}
								</td>
				          		<td onclick="checkDetail(${review.rno})" data-target="#reviewDetailPop" data-toggle="modal">${review.rdate}</td>
				          		<td><input type="button" class="hollow button alert" onclick="deleteReview(${review.rno})" value="삭제"></td>
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
		              <li><a class="pagination-pointed-button" href="myreview.do?page=${index}&todate=${paging.todate}&fromdate=${paging.fromdate}" aria-label="Page ${index}">${index}</a></li>
		            </c:otherwise>
		          </c:choose>
		        </c:forEach>        
		        <li class="pagination-next disabled">Next
		            <span class="show-for-sr">page</span></li>
		      </ul>
		    <!-- pageing template --> 	
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
		      				<th>댓글 작성자</th> <th>댓글 내용</th> <th>날 짜</th>
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
	    $('.reviewStars').barrating({
	      theme: 'fontawesome-stars',
	      readonly: 'true'
	    });
	  });
</script>
</body>
<c:import url="../footer.jsp" />
</html>
