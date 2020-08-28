<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/db/pie1.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파이 그래프</title>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/classdb" user="scott" password="1234" />
<sql:query var="rs" dataSource="${conn }">
	select name, count(*) cnt
	from board
	group by name
	having count(*) >= 1 order by cnt desc
</sql:query>
</head>
<body>
	<div id="container" style="width: 75%; border :1px solid black">
		<canvas id="canvas"></canvas>
	</div>
	<script>
		var NAMES=[<c:forEach items="${rs.rows}" var="m">"${m.name}",</c:forEach>];
		var randomColorFactor = function() {
			return Math.round(Math.random()*255);
		}
		var randomColor = function() {
			return "rgb(" + randomColorFactor() + ","
					+ randomColorFactor() + ","
					+ randomColorFactor() + ")"
		}
		var config = {
				type : 'pie',
				data : {
					datasets : [{
						data : [<c:forEach items="${rs.rows}" var="m">"${m.cnt}",</c:forEach>],
						backgroundColor: [<c:forEach items="${rs.rows}" var="m">randomColor(),</c:forEach>],
						label : '파이 그래프'
					}],
					labels : NAMES
				},
				options : {
					responsive : true,
					legend : {position : 'top'},
					title : {
						display : true,
						text : '글쓴이별 게시물 등록 건수'
					},
					animation : {
						animateScale : true,
						animateRotate : true
					}
				}
		};
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, config);
		}
	</script>
</body>
</html>