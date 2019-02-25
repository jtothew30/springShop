<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Product page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.css">
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
	var total;
	
	$(function(){
		prolist = new Array();
		seloplist = new Array();
		<c:forEach var="pro" items="${prolist}">
			var json = new Object();
			json.pno = "${pro.pno}";
			json.options = "${pro.options}";
			json.outprice = "${pro.outprice}"; 
			json.count = 1;
			prolist.push(json);
		</c:forEach>	
	})
		
	function selectOption() {
		var sel = document.getElementById("selectOption");
		var op = sel.options[sel.selectedIndex].text;
		
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
			addops += "<input type='button' onclick=\"opCancel("+seloplist[i].pno+")\" value='취소'></label></div>"
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
		
		
		
		$.ajax({
			type: "POST",
			url: "../cart/addCart.do",
			data : {'list' : JSON.stringify(seloplist), 'pbno' : pbno},
			success : function(data){
				if(data == 'false'){
					swal("");
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
			url: "../payment/payrequest.do",
			data : {'list' : JSON.stringify(templist), 'pbno' : pbno},
			success : function(){
				swal("결제페이지로 이동합니다.","", "success")
				.then((value) => {
			      location.href="../payment/paymentPage.do";
				});			
			}
		})	
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
	<!-- Start Top Bar -->
	<div class="top-bar">
		<div class="top-bar-left">
			<ul class="dropdown menu" data-dropdown-menu="" role="menubar"
				data-e="n2avhw-e">
				<li class="menu-text" role="menuitem">Yeti Store</li>
				<li class="has-submenu is-dropdown-submenu-parent opens-right"
					role="menuitem" aria-haspopup="true" aria-label="One"><a
					href="#">One</a>
					<ul class="submenu menu vertical is-dropdown-submenu first-sub"
						data-submenu="" role="menu">
						<li role="menuitem"
							class="is-submenu-item is-dropdown-submenu-item"><a href="#">One</a></li>
						<li role="menuitem"
							class="is-submenu-item is-dropdown-submenu-item"><a href="#">Two</a></li>
						<li role="menuitem"
							class="is-submenu-item is-dropdown-submenu-item"><a href="#">Three</a></li>
					</ul></li>
				<li role="menuitem"><a href="#">Two</a></li>
				<li role="menuitem"><a href="#">Three</a></li>
			</ul>
		</div>
		<div class="top-bar-right">
			<ul class="menu">
				<li><input type="search" placeholder="Search"></li>
				<li><button type="button" class="button">Search</button></li>
			</ul>
		</div>
	</div>
	<!-- End Top Bar -->
	<br>
	<!-- You can now combine a row and column if you just need a 12 column row -->
	<article class="grid-container">
		<div class="grid-x cell">
			<nav aria-label="You are here:" role="navigation">
				<ul class="breadcrumbs">
					<li><a href="#">Home</a></li>
					<li><a href="#">Features</a></li>
					<li class="disabled">Gene Splicing</li>
					<li><span class="show-for-sr">Current: </span> Cloning</li>
				</ul>
			</nav>
		</div>
		<div class="grid-x grid-margin-x">
			<div class="medium-6 cell">
				<img class="thumbnail" src="${pageContext.request.contextPath}/resources/upload/${path}/메인.jpg"
					width="650" height="350">
				<div class="grid-x grid-padding-x small-up-4">
					<div class="cell">
						<img src="${pageContext.request.contextPath}/resources/upload/${path}/1.JPG" width="200"
							height="200" align="middle">
					</div>
					<div class="cell">
						<img src="${pageContext.request.contextPath}/resources/upload/${path}/2.JPG" width="200"
							height="200" align="middle">
					</div>
				</div>
			</div>
			<div class="medium-6 large-5 cell large-offset-1">
				<h3>설명</h3>
				<p>옵션선택하면 수량 선택 보여주기</p>
				<label>옵션 <select id="selectOption" onchange="selectOption()">
						<option value="" selected>옵션 선택</option>
						<c:forEach var="op" items="${prolist}">
							<option value="${op.options}">${op.options}</option>
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
				<li class="tabs-title is-active" role="presentation" >
				<a href="#panel1" aria-selected="true" role="tab" aria-controls="panel1" id="panel1-label" tabindex="0">상품상세</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label" tabindex="-1">판매자정보</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel3" role="tab" aria-controls="panel3" aria-selected="false" id="panel3-label" tabindex="-1">상품리뷰</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel4" role="tab" aria-controls="panel4" aria-selected="false" id="panel4-label" tabindex="-1">Q&A</a></li>
			</ul>
			</div>
			<div class="tabs-content" data-tabs-content="example-tabs">
				<div class="tabs-panel is-active" id="panel1" role="tabpanel"
					aria-labelledby="panel1-label">
					<div class="media-object stack-for-small">
						<div class="media-object-section" style="text-align: center">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단1.JPG" width="100%" align="middle">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단2.JPG" width="100%" align="middle">
							<img src="${pageContext.request.contextPath}/resources/upload/${path}/하단3.JPG" width="100%" align="middle">
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
					<div class="media-object stack-for-small">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/200x200"
								hidden="" style="display: none !important;">
						</div>
						<div class="media-object-section">
							<h5>Mike Stevenson</h5>
							<p>I'm going to improvise. Listen, there's something you
								should know about me... about inception. An idea is like a
								virus, resilient, highly contagious. The smallest seed of an
								idea can grow. It can grow to define or destroy you.</p>
						</div>
					</div>
					<div class="media-object stack-for-small">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/200x200"
								hidden="" style="display: none !important;">
						</div>
						<div class="media-object-section">
							<h5>Mike Stevenson</h5>
							<p>I'm going to improvise. Listen, there's something you
								should know about me... about inception. An idea is like a
								virus, resilient, highly contagious. The smallest seed of an
								idea can grow. It can grow to define or destroy you</p>
						</div>
					</div>
					<div class="media-object stack-for-small">
						<div class="media-object-section">
							<img class="thumbnail" src="https://placehold.it/200x200"
								hidden="" style="display: none !important;">
						</div>
						<div class="media-object-section">
							<h5>Mike Stevenson</h5>
							<p>I'm going to improvise. Listen, there's something you
								should know about me... about inception. An idea is like a
								virus, resilient, highly contagious. The smallest seed of an
								idea can grow. It can grow to define or destroy you</p>
						</div>
					</div>
					<label> My Review <textarea placeholder="None"></textarea>
					</label>
					<button class="button">Submit Review</button>
				</div>
				<div class="tabs-panel" id="panel4" role="tabpanel"
					aria-labelledby="panel4-label" aria-hidden="true">
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
</body>
</html>
