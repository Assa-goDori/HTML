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
	var randomColor = function(opacity) { //opacity : ����
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
				alert("���� ���� : " + e.status);
			}
		})
	}
	
	function yeargraph() {
		$.ajax("yeargraph.do", {
			success : function(data) {
				yearGraphPrint(data);
			},
			error : function(e) {
				alert("���� ���� : " + e.status);
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
					label : '�������հ�',
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
					text : '������ ������'
				},
				legend : {display : false},
				scales : {
					xAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '��'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '������(��)'
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
		var subject = yearname + "�� �� �� ������";
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
					label : '�������հ�',
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
							labelString : '��'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '������(��)'
						},
						stacked : true
					}]
				}
			}
		});
	}
</script>
<meta charset="EUC-KR">
<title>������ ���</title>
</head>
<body>
	<form name="f" method="post" action="costchartForm.do">
		<select name="year" id="year">
			<option value="">�����ϼ���</option>
			<option>2015</option><option>2016</option>
			<option>2017</option><option>2018</option>
			<option>2019</option><option>2020</option>
		</select>
		<script>
			document.f.year.value = "";
			document.f.year.value = "${param.year}";
		</script>
		<input type="submit" value="�˻�">
		<a href="mainchartForm.do">������ ��� ��������</a>
		<h3>${param.year } �� ������ : <fmt:formatNumber value="${list[0].t }" pattern="#,###"/> ��</h3>
	</form>
	<div id="canvas1container">
		<canvas id="canvas1" style="width:100%"></canvas>
	</div>
	<div id="canvas2container">
		<canvas id="canvas2" style="width:100%"></canvas>
	</div>
</body>
</html>