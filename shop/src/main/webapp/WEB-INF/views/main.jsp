<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html class="no-js">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
<link rel="stylesheet" href="resources/css/foundation.css">
<link rel="stylesheet"
	href="resources/foundation-icons/foundation-icons.css">
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

<body>
	<c:import url="header.jsp" />

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
							src="https://i.imgur.com/16z9ObN.jpg" alt="Space">
							<figcaption class="orbit-caption">
								<h1>
									메인화면 1
								</h1>
							</figcaption></li>
						<li class="orbit-slide"><img class="orbit-image"
							src="https://i.imgur.com/JD4Caxa.jpg" alt="Space">
							<figcaption class="orbit-caption">
								<h1>
									메인화면 2
								</h1>
							</figcaption></li>
						<li class="orbit-slide"><img class="orbit-image"
							src="https://i.imgur.com/rsTQbNV.jpg" alt="Space">
							<figcaption class="orbit-caption">
								<h1>
									메인화면 3
								</h1>
							</figcaption></li>
					</ul>
				</div>
			</div>
			<!-- 카로셀 끝 -->
			
			<div class="row">
				<div class="large-12 columns">
					<div class="row">

						<div class="large-4 small-6 columns">
							<h4>Upcoming Shows</h4>
							<hr>
							<div class="row">
								<div class="large-1 column">
									<img src="https://placehold.it/50x50&amp;text=[img]">
								</div>
								<div class="large-9 columns">
									<h5>
										<a href="#">Venue Name</a>
									</h5>
									<h6 class="subheader show-for-small">Doors at 00:00pm</h6>
								</div>
							</div>
							<hr>
							<div class="hide-for-small">
								<div class="row">
									<div class="large-1 column">
										<img src="https://placehold.it/50x50&amp;text=[img]">
									</div>
									<div class="large-9 columns">
										<h5 class="subheader">
											<a href="#">Venue Name</a>
										</h5>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="large-1 column">
										<img src="https://placehold.it/50x50&amp;text=[img]">
									</div>
									<div class="large-9 columns">
										<h5 class="subheader">
											<a href="#">Venue Name</a>
										</h5>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="large-1 column">
										<img src="https://placehold.it/50x50&amp;text=[img]">
									</div>
									<div class="large-9 columns">
										<h5 class="subheader">
											<a href="#">Venue Name</a>
										</h5>
									</div>
								</div>
							</div>
						</div>


						<div class="large-4 small-6 columns">
							<img src="https://placehold.it/300x465&amp;text=Image">
						</div>


						<div class="large-4 small-12 columns">
							<h4>Blog</h4>
							<hr>
							<div class="panel">
								<h5>
									<a href="#">Post Title 1</a>
								</h5>
								<h6 class="subheader">Risus ligula, aliquam nec fermentum
									vitae, sollicitudin eget urna. Suspendisse ultrices ornare
									tempor...</h6>
								<h6>
									<a href="#">Read More »</a>
								</h6>
							</div>
							<div class="panel hide-for-small">
								<h5>
									<a href="#">Post Title 2 »</a>
								</h5>
							</div>
							<div class="panel hide-for-small">
								<h5>
									<a href="#">Post Title 3 »</a>
								</h5>
							</div>
							<a href="#" class="right">Go To Blog »</a>
						</div>

					</div>
				</div>
			</div>


			<footer class="row">
				<div class="large-12 columns">
					<hr>
					<div class="row">
						<div class="large-6 columns">
							<p>&copy; Copyright no one at all. Go to town.</p>
						</div>
						<div class="large-6 small-12 columns">
							<ul class="inline-list right">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li><a href="#">Link 4</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>

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

</html>