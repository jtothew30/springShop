<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Product page</title>
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-stars.css">



<style type="text/css">
	.jbFiexd{
		position: fixed;
		top: 0px;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var prolist; 
	var seloplist;
	var stocklist;
	var total;
	
	$(function(){
		tabs = "${tabs}";
		if(tabs == 'review'){
			$("#li1").removeClass('is-active');
			$("#panel1-label").attr('aria-selected','false');
			$("#panel1-label").attr('tabindex','-1');
			
			$("#li2").addClass('is-active');
			$("#panel3-label").attr('aria-selected','true');
			$("#panel3-label").attr('tabindex','0');
			
			$("#panel1").removeClass('is-active');
			$("#panel1").attr('aria-hidden','true');
			
			$("#panel3").addClass('is-active');
			$("#panel3").removeAttr('aria-hidden');
		}else if(tabs == 'qna'){
			$("#li1").removeClass('is-active');
			$("#panel1-label").attr('aria-selected','false');
			$("#panel1-label").attr('tabindex','-1');
			
			$("#li3").addClass('is-active');
			$("#panel4-label").attr('aria-selected','true');
			$("#panel4-label").attr('tabindex','0');
			
			$("#panel1").removeClass('is-active');
			$("#panel1").attr('aria-hidden','true');
			
			$("#panel4").addClass('is-active');
			$("#panel4").removeAttr('aria-hidden');
		}else{
			$("#li1").addClass('is-active');
			$("#panel1-label").attr('aria-selected','true');
			$("#panel1-label").attr('tabindex','0');
			$("#panel1").addClass('is-active');
			$("#panel1").removeAttr('aria-hidden');
		}
		
		
		prolist = new Array();
		seloplist = new Array();
		stocklist = new Array();
		<c:forEach var="pro" items="${prolist}">
			var json = new Object();
			json.pno = "${pro.pno}";
			json.options = "${pro.options}";
			json.outprice = "${pro.outprice}"; 
			json.count = 1;
			prolist.push(json);
			
			var stock = new Object();
			stock.pno = "${pro.pno}";
			stock.options = "${pro.options}";
			stock.stock = "${pro.count}";
			stocklist.push(stock);
		</c:forEach>	
	})
		
	function selectOption() {
		var sel = document.getElementById("selectOption");
		var op = sel.options[sel.selectedIndex].value;
		
		var pro;
		var flag = false;
		
		for(var i=0; i<prolist.length; i++){
			if(prolist[i].options == op){
				pro = prolist[i];
				for(var i=0; i<seloplist.length; i++){
					if(seloplist[i].options == pro.options)
						flag = true;
				}
				if(flag == false)
					seloplist.push(pro);
			}
		}
		showOpMenu();		
		showTotal();
	}
		
	function changeCount(pno, price) {		
		var count = $("#count"+pno).val();
		$("#price"+pno).html(count*price);
		for(var i=0; i<seloplist.length; i++){
			if(seloplist[i].pno == pno)
				seloplist[i].count = count;
		}
		showTotal();
	}
	
	function opCancel(pno) {
		for(var i=0; i<seloplist.length; i++){
			if(seloplist[i].pno == pno){
				seloplist.splice(i,1);				
			}
		}
		showOpMenu();
		showTotal();
	}
	
	function showOpMenu() {
		var addops = "";
		var opmenu = $("#showOption").html();
		for(var i=0; i<seloplist.length; i++){
			addops += "<div class='small-5 cell'><label for='middle-label' class='middle'>"+seloplist[i].options+"</label></div>";
			addops += "<div class='small-2 cell'><input type='number' name='count' id='count"+seloplist[i].pno+"' min='1' value='1' onInput=\"changeCount("+seloplist[i].pno+","+seloplist[i].outprice+")\" placeholder='수량'></div>";
			addops += "<div class='small-5 cell'><label for='middle-label' class='middle'>&nbsp;&nbsp;&nbsp;<span id='price"+seloplist[i].pno+"'>"+seloplist[i].outprice+"</span>원&nbsp;&nbsp;&nbsp;";
			addops += "<button type='button' class=\"btn btn-danger\" onclick=\"opCancel("+seloplist[i].pno+")\" >취소</button></label></div>"
		}
		$("#showOption").html(addops);
	}
	
	function showTotal() {
		total = 0;
		for(var i=0; i<seloplist.length; i++){
			var count = $("#count"+seloplist[i].pno).val();
			var price = seloplist[i].outprice;
			total += count*price;
		}
		$("#total").html(total);
	}
	
	function addCart(pbno) {
		if(!seloplist.length){
			swal("상품을 먼저 선택해주세요!");
			return;
		}
		
		if(checkStock()==-1)
			return;
		
		$.ajax({
			type: "POST",
			url: "../cart/addCart.do",
			data : {'list' : JSON.stringify(seloplist), 'pbno' : pbno},
			success : function(data){
				if(data == 'false'){
					swal("이미 장바구니에 있는 옵션을 선택하셨습니다! 장바구니 상품들을 확인하시겠습니까?", "", "warning", {
						  buttons: {				    
						    catch: {
						      text: "장바구니 보러가기",
						      value: "catch",
						    },
						    cancel: "취소",
						  },
						})
						.then((value) => {
						  switch (value) {					 
						    case "catch":
						    	location.href="../cart/cart.do";	    	
						      break;					 
						    default:
						    	break;
						  }
						});
				}
				else{
					swal("상품을 장바구니에 담았습니다.","장바구니로 이동하시겠습니까?", "success", {
						  buttons: {				    
						    catch: {
						      text: "장바구니 보러가기",
						      value: "catch",
						    },
						    cancel: "취소",
						  },
						})
						.then((value) => {
						  switch (value) {					 
						    case "catch":
						      location.href="../cart/cart.do";
						      break;					 
						    default:
						    	break;
						  }
						});
				}
			}
		})
	}
	
	
	function payreq(pbno) {
		if(!seloplist.length){
			swal("상품을 먼저 선택해주세요!");
			return;
		}
		
		if(checkStock()==-1)
			return;
		
		var templist = new Array();
		for(var i=0; i<seloplist.length; i++){
			var json = new Object();
			json.pno = seloplist[i].pno;
			json.pbno = pbno;
			json.count =  seloplist[i].count;
			json.price = seloplist[i].outprice;
			templist.push(json);
		}
	
		$.ajax({
			type: "POST",
			url: "../payment/checkPayment.do",
			success : function(data){
				if(data == true){
					$.ajax({
						type: "POST",
						url: "../payment/payrequest.do",
						data : {'list' : JSON.stringify(templist), 'pbno' : pbno, 'del' : 'false'},
						success : function(){
							swal("결제페이지로 이동합니다.","", "success")
							.then((value) => {
						      location.href="../payment/paymentPage.do";
							});			
						}
					})		
				}else{
					swal("이미 진행 중인 결제건이 있습니다!","","warning",  {
						  buttons: {				    
						    catch: {
						      text: "기존 결제건 확인.",
						      value: "catch",
						    },
						    defeat:{
						    	text: "기존 건 삭제 후 진행.",
						    	value: "defeat",
						    },
						    cancel: "취소",
						  },
						})
						.then((value) => {
						  switch (value) {					 
						    case "catch":
						    	location.href="../payment/paymentPage.do";		    	
						      break;	
						    case "defeat":
						    	$.ajax({
									type: "POST",
									url: "../payment/payrequest.do",
									data : {'list' : JSON.stringify(templist), 'pbno' : pbno, 'del' : 'true'},
									success : function(){
										swal("결제페이지로 이동합니다.","", "success")
										.then((value) => {
									      location.href="../payment/paymentPage.do";
										});			
									}
								})
						    	break;
						    default:
						    	break;
						  }
						});	
				}
			}
		})	
	}
	
	
	function checkStock() {
		for(var i=0; i<seloplist.length; i++){
			for(var j=0; j<stocklist.length; j++){
				if(seloplist[i].pno == stocklist[j].pno){					
					if(seloplist[i].count*1 > stocklist[j].stock*1){
						swal("옵션 '"+seloplist[i].options+"'의 재고를 넘어선 요청입니다.");
						return -1;
					}					
				}
			}			
		}
	}
	
	function imgchg(img) {
		//alert(document.getElementById("img"+img).src);
		document.getElementById("thumbnail").src = document.getElementById("img"+img).src;
	}
	
	
	
	
	$(document).ready(function() {
		var jbOffset = $('.tabs').offset();
		$(window).scroll(function() {
			if($(document).scrollTop() > jbOffset.top){
				$('.tabs').addClass('jbFixed');
			}
			else{
				$('.tabs').removeClass('jbFixed');
			}
		});		
	});
	
</script>


</head>
<body>
	<c:import url="header.jsp"/>

	
	<br>
	<!-- You can now combine a row and column if you just need a 12 column row -->
	<article class="grid-container">
		<div class="grid-x cell">
			<strong style="font-size:30pt">${proboard.title}</strong>
		</div>
		<div class="grid-x grid-margin-x">
			<div class="medium-6 cell">
				<img class="thumbnail" id="thumbnail" src="${pageContext.request.contextPath}/resources/upload/${path}/메인.jpg"
					width="450" height="250">
				<div class="grid-x grid-padding-x small-up-4">
					<div class="cell">
						<img onmouseover="imgchg(1)" id="img1" src="${pageContext.request.contextPath}/resources/upload/${path}/메인.jpg" width="200"
							height="200" align="middle">
					</div>
					<div class="cell">
						<img onmouseover="imgchg(2)" id="img2" src="${pageContext.request.contextPath}/resources/upload/${path}/1.jpg" width="200"
							height="200" align="middle">
					</div>
					<div class="cell">
						<img onmouseover="imgchg(3)" id="img3" src="${pageContext.request.contextPath}/resources/upload/${path}/2.jpg" width="200"
							height="200" align="middle">
					</div>
				</div>
			</div>
			<div class="medium-6 large-5 cell large-offset-1">
				<h3>설명</h3>
				<p>현재 판매량 : <strong style="color:red; font-size:15pt">${proboard.totalsales}</strong> 개 !!</p>
				<label>옵션 <select id="selectOption" onchange="selectOption()">
						<option value="" selected>옵션 선택</option>
						<c:forEach var="op" items="${prolist}">
							<option value="${op.options}">${op.options}-재고:${op.count}</option>
						</c:forEach>
				</select>
				</label>
				<div class="grid-x">	
					<div class="grid-x" id="showOption"></div>									
				</div>	
				<hr>
				<p style="font-size:13pt; font-weight:900;">총 합계금액(수량) : &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red; font-size:30pt;" id="total">0</span> 원</p>
				<hr>		
				<div class="button-group expanded">
					<a href="#" class="button large" onclick="addCart(${pbno})">장바구니 담기</a> 
					<a href="#" class="button large" onclick="payreq(${pbno})">바로 구매하기</a>
				</div>
			</div>
		</div>
		<div class="">
			<hr>
			<div style="text-align: center">
			<ul class="tabs" data-tabs="" id="example-tabs" role="tablist" data-e="af0r5m-e">
				<li class="tabs-title" id="li1" role="presentation" >
				<a href="#panel1" role="tab" aria-controls="panel1" aria-selected="false" id="panel1-label" tabindex="-1">상품상세</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label" tabindex="-1">판매자정보</a></li>
				<li class="tabs-title" id="li2" role="presentation">
				<a href="#panel3" role="tab" aria-controls="panel3" aria-selected="false" id="panel3-label" tabindex="-1">상품리뷰</a></li>
				<li class="tabs-title" id="li3" role="presentation">
				<a href="#panel4" role="tab" aria-controls="panel4" aria-selected="false" id="panel4-label" tabindex="-1">Q&A</a></li>
			</ul>
			</div>
			<div class="tabs-content" data-tabs-content="example-tabs">
				<div class="tabs-panel" id="panel1" role="tabpanel"
					aria-labelledby="panel1-label" aria-hidden="true">
					<div class="media-object stack-for-small">
						<div class="media-object-section" style="text-align: center">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단1.jpg" width="100%" align="middle">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단2.jpg" width="100%" align="middle">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단3.jpg" width="100%" align="middle">
						</div>
					</div>
				</div>
				<div class="tabs-panel" id="panel2" role="tabpanel"
					aria-labelledby="panel2-label" aria-hidden="true">
					<div class="grid-x grid-margin-x medium-up-3 large-up-5">
						<div class="cell">
							<img class="thumbnail" src="https://placehold.it/350x200"
								hidden="" style="display: none !important;">
							<h5>
								Other Product <small>$22</small>
							</h5>
							<p>In condimentum facilisis porta. Sed nec diam eu diam
								mattis viverra. Nulla fringilla, orci ac euismod semper, magna
								diam.</p>
							<a href="#" class="button hollow tiny expanded">Buy Now</a>
						</div>
						<div class="cell">
							<img class="thumbnail" src="https://placehold.it/350x200"
								hidden="" style="display: none !important;">
							<h5>
								Other Product <small>$22</small>
							</h5>
							<p>In condimentum facilisis porta. Sed nec diam eu diam
								mattis viverra. Nulla fringilla, orci ac euismod semper, magna
								diam.</p>
							<a href="#" class="button hollow tiny expanded">Buy Now</a>
						</div>
						<div class="cell">
							<img class="thumbnail" src="https://placehold.it/350x200"
								hidden="" style="display: none !important;">
							<h5>
								Other Product <small>$22</small>
							</h5>
							<p>In condimentum facilisis porta. Sed nec diam eu diam
								mattis viverra. Nulla fringilla, orci ac euismod semper, magna
								diam.</p>
							<a href="#" class="button hollow tiny expanded">Buy Now</a>
						</div>
						<div class="cell">
							<img class="thumbnail" src="https://placehold.it/350x200"
								hidden="" style="display: none !important;">
							<h5>
								Other Product <small>$22</small>
							</h5>
							<p>In condimentum facilisis porta. Sed nec diam eu diam
								mattis viverra. Nulla fringilla, orci ac euismod semper, magna
								diam.</p>
							<a href="#" class="button hollow tiny expanded">Buy Now</a>
						</div>
						<div class="cell">
							<img class="thumbnail" src="https://placehold.it/350x200"
								hidden="" style="display: none !important;">
							<h5>
								Other Product <small>$22</small>
							</h5>
							<p>In condimentum facilisis porta. Sed nec diam eu diam
								mattis viverra. Nulla fringilla, orci ac euismod semper, magna
								diam.</p>
							<a href="#" class="button hollow tiny expanded">Buy Now</a>
						</div>
					</div>
				</div>
				<div class="tabs-panel" id="panel3" role="tabpanel"
					aria-labelledby="panel3-label" aria-hidden="true">
					<h4>상품리뷰</h4>
					
					<c:import url="/review/review.do" />
					
				</div>
				<div class="tabs-panel" id="panel4" role="tabpanel"
					aria-labelledby="panel4-label" aria-hidden="true">
					<h4>QnA</h4>
					
					<c:import url="/review/qna.do" />
				</div>
			</div>
		</div>
		<hr>
		<div class="grid-x align-justify align-middle">
			<div class="small-12 medium-shrink cell">
				<ul class="menu">
					<li class="align-self-middle">Yeti Store</li>
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<div class="small-12 medium-shrink cell">
				<span>Copyright 2018</span>
			</div>
		</div>
	</article>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/foundation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.barrating.min.js"></script>
</body>
</html>
