<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
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
  
  <link rel="apple-touch-icon" sizes="180x180" href="../../assets/apple-icon-180x180.png">
  <link href="../../assets/favicon.ico" rel="icon">

  <title>CarKeeping Book</title>  

<link href="../../css/main.3f6952e4.css" rel="stylesheet"></head>

<body class="">
<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>
<!-- Add your content of header -->
<decorator:head />
<header>
  <nav class="navbar  navbar-fixed-top navbar-default">
    <div class="container">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav ">
          <li><a href="${path }/model2/member/logout.do" title="">${sessionScope.login } Logout</a></li>
          <li><a href="${path }/model2/main/mainForm.do" title="">01 : Home</a></li>
          <li><a href="${path }/model2/member/info.do?id=${sessionScope.login }" title="">02 : My Profile</a></li>
          <c:if test="${sessionScope.login == 'admin' }">
          	<li><a href="${path }/model2/member/list.do" title="">02-1 : Member List</a></li>
          </c:if>
          <li><a href="${path }/model2/board/list.do?boardtype=0" title="">03 : Board</a></li>
          <li><a href="${path }/model2/board/list.do?boardtype=1" title="">04 : TipBoard</a></li>
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/selectcarForm.do','','width=500, height=250, left=150,top=150')">05 : KeepingBook</a></li>
        </ul>


          <ul class="nav navbar-nav navbar-right navbar-small visible-md visible-lg">
            <li><a href="repairmain.do" title="" class="active">관리메인으로</a></li>
          </ul>

      </div> 
    </div>
  </nav>
</header>
<div class="section-container">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <img src="../../assets/images/work001-01.jpg" class="img-responsive" alt="">
        <div class="card-container">
          <div class="text-center">
            <h1 class="h2"><decorator:title /></h1>
          </div>
          <decorator:body />
        </div>
      </div>

      
      
<!--       <div class="col-md-8 col-md-offset-2 section-container-spacer">
        <div class="row">
          <div class="col-xs-12 col-md-6">
            <img src="work001-02.jpg" class="img-responsive" alt="">
            <p>Menphis skyline</p>
          </div>
          <div class="col-xs-12 col-md-6">
            <img src="work001-03.jpg" class="img-responsive" alt="">
            <p>Menphis skyline</p>
          </div>
        </div>
      </div>

      <div class="col-xs-12">
        <img src="work001-04.jpg" class="img-responsive" alt="">
      </div> -->

    </div>
  </div>
</div>


<footer class="footer-container text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p> UNTITLED | Website created with <a href="http://www.mashup-template.com/" title="Create website with free html template">Mashup Template</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Unsplash</a></p>
      </div>
    </div>
  </div>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     navActivePage();
  });
</script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID 

<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
      (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
  })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
  ga('create', 'UA-XXXXX-X', 'auto');
  ga('send', 'pageview');
</script>

--> <script type="text/javascript" src="../../js/main.70a66962.js"></script></body>

</html>