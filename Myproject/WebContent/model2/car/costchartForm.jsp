<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var randomColorFactor = function() {
		return Math.round(Math.random() * 255);
	}
	var randomColor = function(opacity) { //opacity : 투명도
		return "rgba(" + randomColorFactor() + "," + randomColorFactor() + ","
				+ randomColorFactor() + "," + (opacity || '.3') + ")";
	};
	$(function() {
		monthgraph();
		yeargraph();
	})
	
	function monthgraph() {
		var year = $("#year").val();
		var data = "year=" + year;
		$.ajax({
			url : "monthgraph.do",
			data : data,
			success : function(data) {
				monthGraphPrint(data);
			},
			error : function(e) {
				alert("서버 오류 : " + e.status);
			}
		})
	}
	
	function yeargraph() {
		$.ajax("yeargraph.do", {
			success : function(data) {
				yearGraphPrint(data);
			},
			error : function(e) {
				alert("서버 오류 : " + e.status);
			}
		})
	}
	
	function yearGraphPrint(data) {
		var rows = JSON.parse(data)
		var dates = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item) {
			dates[index] = item.m;
			datas[index] = item.t;
			colors[index] = randomColor(1);
		})
		var chartData = {
			labels : dates,
			datasets : [
				{
					type:'line',
					borderWidth : 2,
					borderColor:colors,
					label : '유지비합계',
					fill : false,
					data : datas
				}
			]
		};
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx, {
			type : 'line',
			data : chartData,
			options : {
				responsive : true,
				title : {
					display : true,
					text : '연도별 유지비'
				},
				legend : {display : false},
				scales : {
					xAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '연'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '유지비(원)'
						},
						stacked : true
					}]
				}
			}
		});
	}
	
	function monthGraphPrint(data) {
		var rows = JSON.parse(data)
		var dates = []
		var datas = []
		var colors = []
		var yearname = $("#year").val();
		if($("#year").val() == "") {
			yearname = '2020';
		}
		var subject = yearname + "년 월 별 유지비";
		$.each(rows, function(index, item) {
			dates[index] = item.m;
			datas[index] = item.t;
			colors[index] = randomColor(1);
		})
	
		var chartData = {
			labels : dates,
			datasets : [
				{
					type:'bar',
					label : '유지비합계',
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
					text : subject
				},
				legend : {display : false},
				scales : {
					xAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '월'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '유지비(원)'
						},
						stacked : true
					}]
				}
			}
		});
	}
</script>
<meta charset="EUC-KR">
<title>관리비 통계</title>
</head>
<body>
	<form name="f" method="post" action="costchartForm.do">
		<select name="year" id="year">
			<option value="">선택하세요</option>
			<option>2015</option><option>2016</option>
			<option>2017</option><option>2018</option>
			<option>2019</option><option>2020</option>
		</select>
		<script>
			document.f.year.value = "";
			document.f.year.value = "${param.year}";
		</script>
		<input type="submit" value="검색">
		<a href="mainchartForm.do">관리비 통계 메인으로</a>
		<h3>${param.year } 총 관리비 : <fmt:formatNumber value="${list[0].t }" pattern="#,###"/> 원</h3>
	</form>
	<div id="canvas1container">
		<canvas id="canvas1" style="width:100%"></canvas>
	</div>
	<div id="canvas2container">
		<canvas id="canvas2" style="width:100%"></canvas>
	</div>
</body>
</html>