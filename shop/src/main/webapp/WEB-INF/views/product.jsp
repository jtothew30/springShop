<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Product page</title>
<link rel="stylesheet" href="resources/css/foundation.css">
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
				<img class="thumbnail" src="resources/product-img/sample1.jpg"
					width="650" height="350">
				<div class="grid-x grid-padding-x small-up-4">
					<div class="cell">
						<img src="resources/product-img/sample1.jpg" width="200"
							height="200" align="middle">
					</div>
					<div class="cell">
						<img src="resources/product-img/sample1.jpg" width="200"
							height="200" align="middle">
					</div>
				</div>
			</div>
			<div class="medium-6 large-5 cell large-offset-1">
				<h3>설명</h3>
				<p>옵션선택하면 수량 선택 보여주기</p>
				<label>옵션 <select>
						<option value="husker">Small</option>
						<option value="starbuck">Medium</option>
						<option value="hotdog">Large</option>
						<option value="apollo">Yeti</option>
				</select>
				</label>
				<div class="grid-x">
					<div class="small-3 cell">
						<label for="middle-label" class="middle">Quantity</label>
					</div>
					<div class="small-9 cell">
						<input type="text" id="middle-label"
							placeholder="One fish two fish">
					</div>
				</div>
				<div class="button-group expanded">
					<a href="#" class="button large">장바구니 담기</a> <a href="#"
						class="button large">바로 구매하기</a>
				</div>
			</div>
		</div>
		<div class="">
			<hr>
			<ul class="tabs" data-tabs="" id="example-tabs" role="tablist"
				data-e="af0r5m-e">
				<li class="tabs-title is-active" role="presentation">
				<a href="#panel1" aria-selected="true" role="tab" aria-controls="panel1" id="panel1-label" tabindex="0">상품리뷰</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel2" role="tab" aria-controls="panel2" aria-selected="false" id="panel2-label" tabindex="-1">연관상품</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel3" role="tab" aria-controls="panel3" aria-selected="false" id="panel3-label" tabindex="-1">판매자정보</a></li>
				<li class="tabs-title" role="presentation">
				<a href="#panel4" role="tab" aria-controls="panel4" aria-selected="false" id="panel4-label" tabindex="-1">Q&A</a></li>
			</ul>
			<div class="tabs-content" data-tabs-content="example-tabs">
				<div class="tabs-panel is-active" id="panel1" role="tabpanel"
					aria-labelledby="panel1-label">
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
	<script src="resources/js/vendor/jquery.js"></script>
	<script src="resources/js/vendor/foundation.js"></script>
	<script src="resources/js/app.js"></script>
</body>
</html>
