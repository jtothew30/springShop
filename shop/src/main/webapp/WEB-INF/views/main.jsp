<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html class="no-js">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
	<link rel="stylesheet" href="resources/css/foundation.css">
	<link rel="stylesheet" href="resources/css/app.css">
	<link rel="stylesheet" href="resources/foundation-icons/foundation-icons.css">
<style type="text/css">

.fullscreen-image-slider .orbit-image {
  width: 100%;
  height: 60vh;
}

.fullscreen-image-slider .orbit-caption {
  bottom: 50%;
  -webkit-transform: translateY(50%);
      -ms-transform: translateY(50%);
          transform: translateY(50%);
  background: none;
  text-align: center;
  color: #fefefe;
  font-weight: bold;
}
</style>
</head>
	<c:import url="header.jsp" />
<body>
	<div style="margin: 10% 10%;">
	<div class="row">
		<div class="large-12 columns">
			<!-- 카로셀 들어갈 자리 -->
			<div class="fullscreen-image-slider">
				<div class="orbit" role="region" aria-label="FullScreen Pictures"
					data-orbit>
					<ul class="orbit-container">
						<button class="orbit-previous">
							<span class="show-for-sr">Previous Slide</span> <span
								class="nav fa fa-chevron-left fa-3x"></span>
						</button>
						<button class="orbit-next">
							<span class="show-for-sr">Next Slide</span> <span
								class="nav fa fa-chevron-right fa-3x"></span>
						</button>
						<li class="is-active orbit-slide"><img class="orbit-image"
							src="${pageContext.request.contextPath}/resources/upload/main/carousel/1.jpg" alt="Space">
							<figcaption class="orbit-caption">
								
							</figcaption></li>
						<li class="orbit-slide"><img class="orbit-image"
							src="${pageContext.request.contextPath}/resources/upload/main/carousel/2.jpg" alt="Space">
							<figcaption class="orbit-caption">
								
							</figcaption></li>
						<li class="orbit-slide"><img class="orbit-image"
							src="${pageContext.request.contextPath}/resources/upload/main/carousel/3.jpg" alt="Space">
							<figcaption class="orbit-caption">
								
							</figcaption></li>
					</ul>
				</div>
			</div>
			<!-- 카로셀 끝 -->

		</div>
	</div>
<div class="row column">
<hr>
</div>
	
<div class="row column">
  <p class="lead">Trending Planetary Destinations</p>
</div>

<div class="row small-up-1 medium-up-2 large-up-3">
<c:forEach items="list" var="list">
  <div class="column">
    <div class="callout">
      <p>---</p>
      <p><img src="${list.imgpath}"></p>
      <p class="lead">${list.etitle}</p>
      <p class="subheader">${list.escript}</p>
    </div>
  </div>
  </c:forEach>
  <div class="column">
    <div class="callout">
      <p>Pegasi B</p>
      <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
      <p class="lead">Copernican Revolution caused an uproar</p>
      <p class="subheader">Find Earth-like planets life outside the Solar System</p>
    </div>
  </div>
  <div class="column">
    <div class="callout">
      <p>Pegasi B</p>
      <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
      <p class="lead">Copernican Revolution caused an uproar</p>
      <p class="subheader">Find Earth-like planets life outside the Solar System</p>
    </div>
  </div>
  <div class="column">
    <div class="callout">
      <p>Pegasi B</p>
      <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
      <p class="lead">Copernican Revolution caused an uproar</p>
      <p class="subheader">Find Earth-like planets life outside the Solar System</p>
    </div>
  </div>
  <div class="column">
    <div class="callout">
      <p>Pegasi B</p>
      <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
      <p class="lead">Copernican Revolution caused an uproar</p>
      <p class="subheader">Find Earth-like planets life outside the Solar System</p>
    </div>
  </div>
  <div class="column">
    <div class="callout">
      <p>Pegasi B</p>
      <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
      <p class="lead">Copernican Revolution caused an uproar</p>
      <p class="subheader">Find Earth-like planets life outside the Solar System</p>
    </div>
  </div>

</div>
	
	</div>
	<script src="resources/js/vendor/jquery.js"></script>
	<script src="resources/js/vendor/foundation.js"></script>
	<script src="resources/js/app.js"></script>
	<script type="text/javascript">
		$(document).foundation({
			orbit : {
				animation : 'slide',
				timer_speed : 1000,
				pause_on_hover : true,
				animation_speed : 500,
				navigation_arrows : true,
				bullets : false
			}
		});
	</script>
</body>
<c:import url="footer.jsp"/>
</html>