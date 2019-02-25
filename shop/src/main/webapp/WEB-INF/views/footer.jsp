<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Home</title>
  <link rel="stylesheet" href="resources/css/foundation.css">
  <link rel="stylesheet" href="resources/css/app.css">
<style type="text/css">
  
.three-column-footer-contact-form-container {
  background-color: #8a8a8a;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form {
  max-width: 75rem;
  margin-right: auto;
  margin-left: auto;
  color: #e6e6e6;
  padding: 3.75rem 0;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form::before, .three-column-footer-contact-form-container .three-column-footer-contact-form::after {
  display: table;
  content: ' ';
  -webkit-flex-basis: 0;
      -ms-flex-preferred-size: 0;
          flex-basis: 0;
  -webkit-order: 1;
      -ms-flex-order: 1;
          order: 1;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form::after {
  clear: both;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form a {
  color: #e6e6e6;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left {
  width: 100%;
  float: left;
  padding-right: 0.625rem;
  padding-left: 0.625rem;
  display: table;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left .baseline {
  display: table-cell;
  vertical-align: bottom;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left .contact-details p {
  font-size: 0.8rem;
  margin-bottom: 0;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left .input-group {
  padding: 2rem 0 0 0;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left .input-group input {
  border-bottom: 2px solid #cacaca;
}

@media print, screen and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left:last-child:not(:first-child) {
  float: right;
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left {
    width: 25%;
    float: left;
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media print, screen and (min-width: 64em) and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-left:last-child:not(:first-child) {
    float: right;
  }
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center {
  text-align: left;
  width: 100%;
  float: left;
  padding-right: 0.625rem;
  padding-left: 0.625rem;
  display: table;
}

@media print, screen and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center:last-child:not(:first-child) {
  float: right;
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center {
    width: 33.33333%;
    float: left;
    padding-right: 0.625rem;
    padding-left: 0.625rem;
    position: relative;
    left: 8.33333%;
  }
}

@media print, screen and (min-width: 64em) and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center:last-child:not(:first-child) {
    float: right;
  }
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center .baseline {
  display: table-cell;
  vertical-align: bottom;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center .input-group {
  padding: 0.5rem 0 0 0;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center .input-group input {
  border-bottom: 2px solid #cacaca;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-center .input-group textarea {
  border-bottom: 2px solid #cacaca;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right {
  text-align: right;
  width: 100%;
  float: left;
  padding-right: 0.625rem;
  padding-left: 0.625rem;
  display: table;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right .baseline {
  display: table-cell;
  vertical-align: bottom;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right h2 {
  color: #fefefe;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right p {
  font-size: 0.8rem;
  margin-bottom: 0;
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right .fa {
  padding: 1rem 0 1rem 0.2rem;
}

@media print, screen and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

.three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right:last-child:not(:first-child) {
  float: right;
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right {
    width: 25%;
    float: left;
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media print, screen and (min-width: 64em) and (min-width: 40em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right {
    padding-right: 0.9375rem;
    padding-left: 0.9375rem;
  }
}

@media print, screen and (min-width: 64em) {
  .three-column-footer-contact-form-container .three-column-footer-contact-form .footer-right:last-child:not(:first-child) {
    float: right;
  }
}


</style>
  
</head>

<body>
<div style="margin: 0% 0%;">
<div class="three-column-footer-contact-form-container">
  <footer class="three-column-footer-contact-form" data-equalizer data-equalize-by-row="true">
    <div class="footer-left" data-equalizer-watch>
      <div class="baseline">
        <div class="contact-details">
          <h6>Contact details</h6>
          <p><i class="fa fa-phone fa-lg" aria-hidden="true"></i> 01234 567890</p>
          <p><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i> Contact us</a></p>
          <p><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i> Street, City, County, Country</p>
        </div>
        <div class="newsletter">
          <div class="input-group">
            <h6>Sign up for our newsletter</h6><p>
            <input class="input-group-field" type="email" placeholder="Email address">
          </div>
          <a class="button expanded" href="#">Submit</a>
        </div>
      </div>
     </div>
    <div class="footer-center" data-equalizer-watch>
      <div class="baseline">
        <div class="newsletter">
          <h6>Contact form</h6>
          <div class="input-group">
            <p><input class="input-group-field" type="text" placeholder="Name"><p>
            <input class="input-group-field" type="email" placeholder="Email address"><p>
            <textarea placeholder="Message"></textarea><p>
          </div>
          <a class="button expanded" href="#">Submit</a>
        </div>
      </div>
    </div>
    <div class="footer-right" data-equalizer-watch>
      <div class="baseline">
        <img class="thumbnail" src="http://placehold.it/100">
        <h6>Opening times</h6>
        <p>Mon - Fri 9:00am - 5:00pm</p>
        <p>Sat 9:00am - 8:00pm</p>
        <p>Sun 9:00am - 4:00pm</p>
        <div class="social">
          <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
          <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
          <i class="fa fa-google-plus-square fa-2x" aria-hidden="true"></i>
          <i class="fa fa-linkedin-square fa-2x" aria-hidden="true"></i>
        </div>
      </div>
    </div>
  </footer>
</div>
</div>
</body>

</html>