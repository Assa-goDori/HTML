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
  
  <link rel="apple-touch-icon" sizes="180x180" href="../../assets/apple-icon-180x180.png">
  <link href="../../assets/favicon.ico" rel="icon">

  <title>차계부 메인</title>  

<link href="../../css/main.3f6952e4.css" rel="stylesheet"></head>

<body class="">
<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>
 <!-- Add your content of header -->
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
          <li><a href="#" title="" onclick="window.open('${path}/model2/member/selectcarForm.do','','width=500,height=350,left=50,top=150')">05 : KeepingBook</a></li>
        </ul>


      </div> 
    </div>
  </nav>
</header>

<div class="section-container">
  <div class="container">
    <div class="row">
      
      <div class="col-sm-8 col-sm-offset-2 section-container-spacer">
        <div class="text-center">
          <h1 class="h2">
          	<c:choose>
				<c:when test="${cartype==1 }">
					${mem.brand1 } ${mem.carname1 }
				</c:when>
				<c:when test="${cartype==2 }">
					${mem.brand2 } ${mem.carname2 }
				</c:when>
			</c:choose>
          </h1>
        </div>
      </div>

      <div class="col-md-12">
     
      <div id="myCarousel" class="carousel slide projects-carousel">
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="row">
                    <div class="col-sm-4">
                      <a href="repairForm.do?repairtype=1" title="" class="black-image-project-hover">
                        <img src="../../assets/images/a.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>001/006</h4>
                        <h3>정비 관리</h3>
                        <p>Repair</p>
                        <a href="repairForm.do?repairtype=1" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <a href="fuelForm.do?repairtype=2" title="" class="black-image-project-hover">
                        <img src="../../assets/images/b.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>002/006</h4>
                        <h3>주유 관리</h3>
                        <p>Fuel</p>
                        <a href="fuelForm.do?repairtype=2" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <a href="insuranceForm.do?repairtype=3" title="" class="black-image-project-hover">
                        <img src="../../assets/images/c.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>003/006</h4>
                        <h3>보험금 관리</h3>
                        <p>Insurance</p>
                        <a href="insuranceForm.do?repairtype=3" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    
                </div>
                <!--/row-->
            </div>
            <!--/item-->
            <div class="item">
                <div class="row">
                  <div class="col-sm-4">
                    <a href="othersForm.do?repairtype=4" class="black-image-project-hover">
                      <img src="../../assets/images/d.jpg" alt="Image" class="img-responsive">
                    </a>
                    <div class="card-container">
                      <h4>004/006</h4>
                      <h3>기타 유지비 관리</h3>
                      <p>Others</p>
                      <a href="othersForm.do?repairtype=4" class="btn btn-default">Discover</a>
                    </div>
                  </div>
                   <div class="col-sm-4">
                      <a href="mainchartForm.do" class="black-image-project-hover">
                        <img src="../../assets/images/e.jpg" alt="Image" class="img-responsive">
                      </a>
                      <div class="card-container">
                        <h4>005/006</h4>
                        <h3>관리비 통계</h3>
                        <p>Cost Chart</p>
                        <a href="mainchartForm.do" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    
                    <div class="col-sm-4">
                      <div class="card-container">

                      </div>
                    </div>
                    
                </div>
                <!--/row-->
            </div>
            
            <!--/item-->
        </div>
        <!--/carousel-inner--> 
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">◁</a>

        <a class="right carousel-control" href="#myCarousel" data-slide="next">▷</a>
     </div>



    <!--/myCarousel-->
    </div>



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