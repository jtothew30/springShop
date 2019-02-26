<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html class="no-js">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Home</title>
  <link rel="stylesheet" href="resources/css/foundation.css">
  <link rel="stylesheet" href="resources/foundation-icons/foundation-icons.css">
</head>

<body>
  <c:import url="header.jsp" />

  <div class="row">
    <div class="large-12 columns">

      <div class="row">
        <div class="large-12 hide-for-small">
          <div id="featured" data-orbit>
            <img src="resources/product-img/sample1.jpg" alt="slide image">
            <img src="resources/product-img/sample1.jpg" alt="slide image">
            <img src="resources/product-img/sample1.jpg" alt="slide image">
          </div>
        </div>
      </div>
      <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit="5v80tq-orbit">
        <ul class="orbit-container" tabindex="0" style="height: 25.6px;">
          <button class="orbit-previous" aria-label="previous" tabindex="0"><span class="show-for-sr">Previous Slide</span>◀</button>
          <button class="orbit-next" aria-label="next" tabindex="0"><span class="show-for-sr">Next Slide</span>▶</button>
          <li class="orbit-slide" data-slide="0" style="max-height: 25.6px; display: none; position: relative; top: 0px;">
            <img src="resources/product-img/sample1.jpg">
          </li>
          <li class="orbit-slide" data-slide="1" style="position: relative; max-height: 25.6px; top: 0px; display: none;">
            <img src="resources/product-img/sample1.jpg">
          </li>
          <li class="orbit-slide" data-slide="2" style="position: relative; max-height: 25.6px; top: 0px; display: none;">
            <img src="resources/product-img/sample1.jpg" hidden="" style="display: none !important;">
          </li>
          <li class="orbit-slide is-active" data-slide="3" style="position: relative; max-height: 25.6px; top: 0px; display: block;"
            aria-live="polite">
            <img src="resources/product-img/sample1.jpg" hidden="" style="display: none !important;">
          </li>
        </ul>
      </div>

     
      <div class="row">
        <div class="large-12 columns show-for-small">
          <img src="resources/product-img/sample1.jpg">
        </div>
      </div><br>

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
                  <h5><a href="#">Venue Name</a></h5>
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
                    <h5 class="subheader"><a href="#">Venue Name</a></h5>
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="large-1 column">
                    <img src="https://placehold.it/50x50&amp;text=[img]">
                  </div>
                  <div class="large-9 columns">
                    <h5 class="subheader"><a href="#">Venue Name</a></h5>
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="large-1 column">
                    <img src="https://placehold.it/50x50&amp;text=[img]">
                  </div>
                  <div class="large-9 columns">
                    <h5 class="subheader"><a href="#">Venue Name</a></h5>
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
                <h5><a href="#">Post Title 1</a></h5>
                <h6 class="subheader">
                  Risus ligula, aliquam nec fermentum vitae, sollicitudin eget urna. Suspendisse ultrices ornare
                  tempor...
                </h6>
                <h6><a href="#">Read More »</a></h6>
              </div>
              <div class="panel hide-for-small">
                <h5><a href="#">Post Title 2 »</a></h5>
              </div>
              <div class="panel hide-for-small">
                <h5><a href="#">Post Title 3 »</a></h5>
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
</body>

</html>