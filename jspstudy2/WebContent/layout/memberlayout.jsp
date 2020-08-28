<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<script type="text/javascript">
function win_open(page) {
	   var op = "width=200, height=150, left=50,top=150";
	   open(page+".me","",op);
}
</script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<decorator:head />
</head>
<body class="w3-black">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <c:if test="${empty sessionScope.login }">
  	<a href="${path}/model2/member/loginForm.me" class="w3-bar-item w3-button w3-padding-large w3-black">
  	<p>Login</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="win_open('joinForm')">
  	<p>Sign up</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="window.open('${path}/model2/member/idForm.me','width=200','height=150','left=50','top=150')">
  	<p>Find id</p>
  	</a>
  	<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black" onclick="window.open('${path}/model2/member/pwForm.me','width=200','height=150','left=50','top=150')">
  	<p>Find password</p>
  	</a>
  </c:if>
  <c:if test="${!empty sessionScope.login }">
  		<c:if test="${!empty sessionScope.pic}">
  			<img src="${path }/model2/member/picture/${sessionScope.pic}" width="100" height="150">
  		</c:if>
  		<c:if test="${empty sessionScope.pic}">
  			<img src="${path }/model2/member/picture/null.jpg" width="100" height="150">
  		</c:if>
		${sessionScope.login }��&nbsp;&nbsp;&nbsp;<br>
		<a href="${path }/model2/member/logout.me">�α׾ƿ�</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </c:if>
  
  <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>HOME</p>
  </a>
  <a href="${path}/model2/board/list.do" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>BOARD</p>
  </a>
  <%--ajax�� ���� ���� ȯ�� ���� ���� ��� --%>
  <div>
  	<div id="exchange"></div>
  </div>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="#body" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
    <a href="#body" class="w3-bar-item w3-button" style="width:25% !important">BOARD</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main" style="background-color: white;">
<%-- <c:if test="${empty sessionScope.login}"> --%>
  <header class="w3-container w3-padding-32 w3-center w3-black1" id="home" style="width:100%; background: white;">
    <div id="piecontainer" style="width: 40%; float:left; border : 1px solid black">
    	<canvas id="canvas1" style="width:100%;"></canvas>
    </div>
    <div id="barcontainer" style="width: 40%; float:right; border : 1px solid black">
    	<canvas id="canvas2" style="width:100%;"></canvas>
    </div>
  </header>
<%-- </c:if> --%>
  <!-- body Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="body" >
  	<decorator:body />
  </div>
   
    <!-- Footer -->
  <footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
    <p class="w3-medium">������ �÷��� ������ �缺 ���� 2ȸ�� ��2 ���α׷� ����</p>
  	<%--KEB�ϳ����� ���� ����ϱ� : USD,JPY,EUR,CNY : �Ÿű�����, ������Ƕ�, �����ĽǶ� --%>
  	<div id="exchange2"></div>
    <p class="w3-medium">���� ��ī���� <a href="https://www.goodee.co.kr" target="_blank" class="w3-hover-text-green">(��)�����ī����</a></p>
  <!-- End footer -->
  </footer>

<!-- END PAGE CONTENT -->
</div>
<script type="text/javascript">
	var randomColorFactor = function() {
		return Math.round(Math.random()*255);
	}
	var randomColor = function(opacity) {	//opacity : ����
		return "rgba(" + randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ (opacity || '.3') + ")";
	};
	
	$(function() {
		piegraph();
		bargraph();
		exchangeRate();	//ȯ�������� ajax�� ���� ũ�Ѹ��ϱ�.
		exchangeRate2();
	})
	
	function exchangeRate() {
		$.ajax("${path}/model2/ajax/exchange.do", {
			success : function(data) {
				$("#exchange").html(data);
			},
			error : function(e) {
				alert("ȯ�� ��ȸ�� ���� ���� : " + e.status);
			}
		})
	}
	
	function exchangeRate2() {
		$.ajax("${path}/model2/ajax/exchange2.do", {
			success : function(data) {
				$("#exchange2").html(data);
			},
			error : function(e) {
				alert("ȯ�� ��ȸ�� ���� ���� : " + e.status);
			}
		})
	}
	
	function piegraph() {
		$.ajax("${path}/model2/ajax/graph.do", {
			success : function(data) {
				pieGraphPrint(data);
			},
			error : function(e) {
				alert("���� ���� : " + e.status);
			}
		})
	}
	function bargraph() {
		$.ajax("${path}/model2/ajax/graph2.do", {
			success : function(data) {
				barGraphPrint(data);
			},
			error : function(e) {
				alert("���� ���� : " + e.status);
			}
		})
	}
	function pieGraphPrint(data) {
		console.log(data)
		var rows = JSON.parse(data)
		var names = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item) {
			/* names[index] = item.name; */
			names[index] = item.name;
			datas[index] = item.cnt;
			colors[index] = randomColor(1);
		})
		var config = {
			type : 'pie',
			data : {
				datasets : [{
					data : datas,
					backgroundColor : colors
				}],
				labels : names
			},
			options : {
				responsive : true,
				legend : {position : 'top'},
				title : {
					display : true,
					text : '�۾��̺� �Խ��� ��� �Ǽ�',
					position : 'bottom'
				}
			}
		}
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx, config);
	}
	function barGraphPrint(data) {
		var rows = JSON.parse(data)
		var dates = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item) {
			/* names[index] = item.name; */
			dates[index] = item.d;
			datas[index] = item.cnt;
			colors[index] = randomColor(1);
		})
	
		var chartData = {
			labels : dates,
			datasets : [
				{
					type:'line',
					borderWidth : 2,
					borderColor:colors,
					label : '�Ǽ�',
					fill : false,
					data : datas
				},
				{
					type:'bar',
					label : '�Ǽ�',
					backgroundColor:colors,
					data : datas,
				}
			]
		};
		
		var ctx = document.getElementById("canvas2").getContext("2d");
		new Chart(ctx, {
			type : 'bar',
			data : chartData,
			options : {
				responsive : true,
				title : {
					display : true,
					text : '�ֱ� ������ ���ں� �Խ��� ��� �Ǽ�'
				},
				legend : {display : false},
				scales : {
					xAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '�Խù� �ۼ���'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '�Խù� �ۼ� �Ǽ�'
						},
						stacked : true	//(0���� ����)
					}]
				}
			}
		});
	}
</script>
</body>
</html>
