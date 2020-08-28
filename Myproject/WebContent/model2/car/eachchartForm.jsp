<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		eachgraph();
	})
	function eachgraph() {
		var year = $("#year").val();
		var repairtype = $("#repairtype").val();
		var data = "year=" + year + "&repairtype=" + repairtype;
		$.ajax({
			url : "eachgraph.do",
			data : data,
			success : function(data) {
				eachGraphPrint(data);
			},
			error : function(e) {
				alert("서버오류 : " + e.status);
			}
		})
	}
	
	function eachGraphPrint(data) {
		var rows = JSON.parse(data)
		var dates = []
		var datas = []
		var colors = []
		var repairtype = null;
		var yearname = $("#year").val();
		var repairtypename = null;
		if($("#repairtype").val() == 1) {
			repairtype = "정비";
		} else if ($("#repairtype").val() == 2) {
			repairtype = "주유";
		} else if ($("#repairtype").val() == 4) {
			repairtype = "기타";
		} else {
			repairtype = "정비";
		}
		if($("#year").val() == "") {
			yearname = '2020';
		}
		var subject = yearname + "년 " + repairtype + " 월 별 유지비";
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
		var ctx = document.getElementById("canvas1").getContext("2d");
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
<title>항목별 관리비 통계</title>
</head>
<body>
	<form name="f" method="post" action="eachchartForm.do">
		<select name="year" id="year">
			<option value="">선택하세요</option>
			<option>2015</option><option>2016</option>
			<option>2017</option><option>2018</option>
			<option>2019</option><option>2020</option>
		</select>
		<select name="repairtype" id="repairtype">
			<option value="">선택하세요</option>
			<option value="1">정비</option>
			<option value="2">주유</option>
			<option value="4">기타유지비</option>
		</select>
		<script>
			document.f.year.value = "${param.year}";
			document.f.repairtype.value = "${param.repairtype}";
		</script>
		<input type="submit" value="검색">
		<a href="mainchartForm.do">관리비 통계 메인으로</a>
	</form>
	<div id="canvas1container">
		<canvas id="canvas1" style="width:100%"></canvas>
	</div>
</body>
</html>