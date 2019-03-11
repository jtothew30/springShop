<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/foundation.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/app.css">
<style type="text/css">

.ecommerce-footer {
  background-color: #fefefe;
  padding: 70px 20px 40px 20px;
}

.ecommerce-footer-links h5 {
  color: #0a0a0a;
  font-size: 1.2rem;
  font-weight: 600;
}

.ecommerce-footer-links .menu > li > a {
  line-height: 1.5em;
  padding: 0.5rem 0rem;
}

.ecommerce-footer-links a {
  color: #ffffff;
  font-size: 1rem;
  transition: all 0.5s ease;
}

.ecommerce-footer-links a:hover {
  color: #0a0a0a;
  transition: all 0.5s ease;
}

.ecommerce-footer-links .more-categories {
  margin-top: 2rem;
}

@media screen and (max-width: 39.9375em) {
  .ecommerce-footer-links .more-categories {
    margin-top: 2rem;
  }
}

@media screen and (max-width: 63.9375em) {
  .ecommerce-footer-links .ecommerce-footer-links-block {
    margin-bottom: 3rem;
  }
}

.ecommerce-footer-bottom-bar {
  border-top: 1px solid #e6e6e6;
  margin-top: 40px;
  padding-bottom: 80px;
  padding-top: 30px;
}

.ecommerce-footer-bottom-bar .menu > li > a {
  line-height: 1.2em;
  padding: 10px 0;
}

.ecommerce-footer-bottom-bar a {
  color: #8a8a8a;
  font-size: 0.9rem;
  transition: all 0.5s ease;
}

.ecommerce-footer-bottom-bar a:hover {
  color: #0a0a0a;
  transition: all 0.5s ease;
}

@media screen and (max-width: 39.9375em) {
  .ecommerce-footer-bottom-bar ul {
    text-align: center;
  }
}

.ecommerce-footer-bottom-bar li {
  display: inline;
}

.ecommerce-footer-bottom-bar .bottom-links {
  margin-top: 0.65rem;
  margin-left: 0;
}

.ecommerce-footer-bottom-bar .bottom-links li {
  padding-right: 2rem;
}

@media screen and (max-width: 39.9375em) {
  .ecommerce-footer-bottom-bar .bottom-links li {
    text-align: center;
  }
}

.ecommerce-footer-bottom-bar .ecommerce-footer-logomark {
  text-align: center;
}

@media screen and (max-width: 39.9375em) {
  .ecommerce-footer-bottom-bar .ecommerce-footer-logomark {
    padding-top: 1rem;
    margin-bottom: 1rem;
  }
}

.ecommerce-footer-bottom-bar .bottom-copyright {
  color: #8a8a8a;
  font-size: 0.9rem;
  line-height: 1.2em;
  padding-top: 1rem;
  text-align: right;
}

@media screen and (max-width: 39.9375em) {
  .ecommerce-footer-bottom-bar .bottom-copyright {
    text-align: center;
  }
}


</style>

</head>

<footer>
	<hr>
	<div style="margin: 0% 0%;">
		<div class="ecommerce-footer" style="background-color: #575757; color:white; ">
			<div class="ecommerce-footer-links row">
				<div class="small-8 medium-8 large-4 columns">
					<div class="row ecommerce-footer-links-block" >
						<div class="small-4 medium-4 large-4 columns">
							<h5>Categories</h5>
							<ul class="menu vertical">
								<li><a href="#">Category 1</a></li>
								<li><a href="#">Category 2</a></li>
								<li><a href="#">Category 3</a></li>
								<li><a href="#">Category 4</a></li>
								<li><a href="#">Category 5</a></li>
							</ul>
						</div>						
						<div class="small-4 medium-4 large-4 columns">
							<h5>Help</h5>
							<ul class="menu vertical">
								<li><a href="${pageContext.request.contextPath}/index.jsp">index</a></li>
								<li><a href="#">Return Policy</a></li>
								<li><a href="#">Shipping &amp; Delivery</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="small-14 medium-14 large-7 columns">
					<div class="row">
						<div class="small-5 medium-5 large-4 columns">
							<h5>My Account</h5>
							<ul class="menu vertical">
								<li><a href="${pageContext.request.contextPath}/signUp/signUp.do">회원가입</a></li>
								<li><a href="${pageContext.request.contextPath}/cart/cart.do">내 장바구니</a></li>
								<li><a href="${pageContext.request.contextPath}/account/mymain.do">마이페이지</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/myorder.do">-주문/배송정보</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/myclaim.do">-취소/반품/교환정보</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/myreview.do">-내상품리뷰</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/myqna.do">-내Q&A</a></li>
							</ul>
						</div>
						<div class="small-3 medium-3 large-4 columns">
							<h5>About</h5>
							<ul class="menu vertical">
								<li><a href="#">Company</a></li>
								<li><a href="#">Store Locator</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">Career</a></li>
							</ul>
						</div>
						<div class="small-4 medium-4 large-4 columns">
							<h5>Admin</h5>
							<ul class="menu vertical">
								<li><a href="${pageContext.request.contextPath}/admin/memberList.do">사용자관리</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/productList.do">제품관리</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/boardList.do">판매글관리</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/mainEdit.do">메인페이지설정</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="ecommerce-footer-bottom-bar row">
				<div class="small-12 medium-5 columns">
					<ul class="bottom-links">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms &amp; Conditions</a></li>
					</ul>
				</div>
				<div class="small-12 medium-2 columns ecommerce-footer-logomark">
					<img src="https://placehold.it/50x50" />
				</div>
				<div class="small-12 medium-5 columns">
					<div class="bottom-copyright">
						<span>©2019 Company Name. All rights reserved.</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

</html>