<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/apple-icon-180x180.png">
  <link href="./assets/favicon.ico" rel="icon">

  <title>CarKeeping Book</title>  
<link href="./css/main.3f6952e4.css" rel="stylesheet"></head>

<body class="minimal">
<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>
<!-- Add your content of header -->
<header>
  <nav class="navbar  navbar-fixed-top navbar-inverse">
    <div class="container">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav ">
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/loginForm.do','','width=500,height=350,left=350,top=150')">00 : Login</a></li>
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/joinForm.do','','width=800,height=550,left=350,top=150')">01 : Sign up</a></li>
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/idForm.do','','width=500, height=450, left=350,top=150')">02 : Find id</a></li>
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/pwForm.do','','width=500, height=450, left=350,top=150')">03 : Find pw</a></li>
        </ul>
      </div>
    </div>
  </nav>
  
</header>
<!-- Add your site or app content here -->
  <div class="hero-full-container background-image-container white-text-container" style="background-image: url('assets/images/hero_1.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="hero-full-wrapper">
            <div class="text-content">
              <h1>CarKeeping Book,<br>
                <span id="typed-strings">
                  <span>More Classic</span>
                  <span>More Detailed</span>
                  <span>More Attractive</span>
                </span>
                <span id="typed"></span>
              </h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     type();
     movingBackgroundImage();
  });
</script>

<script type="text/javascript" src="./js/main.70a66962.js"></script></body>

</html>