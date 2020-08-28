<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSON 데이터 처리하기</title>
<style type="text/css">
	table,td,th {border : 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<table>
	<%
		String caption = null;
		String kebhana2 = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		caption = kebhana2.substring(kebhana2.indexOf(":")+3, kebhana2.indexOf(",")-1);
		out.println("<caption>"+caption+"</caption>");
	%>
		<tr>
			<th rowspan="2">통화명</th>
			<th rowspan="2">매매기준율</th>
			<th colspan="2">현찰</th>
			<th colspan="2">전신환송금</th>
		</tr>
		<tr>
			<th>파실때</th>
			<th>사실때</th>
			<th>보내실때</th>
			<th>받으실때</th>
		</tr>
	
	<%
		String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		String strJson = kebhana.replaceAll("}, ] }", "} ]");
		strJson = strJson.substring(strJson.indexOf("["));
		JSONParser jsonParser = new JSONParser();
		JSONArray array = (JSONArray)jsonParser.parse(strJson);

		for(int i = 0; i < array.size(); i++) {
			JSONObject obj = (JSONObject)array.get(i);

			out.println("<tr><td>" + obj.get("통화명").toString()
						+ "</td><td>" + obj.get("매매기준율").toString()
						+ "</td><td>" + obj.get("현찰파실때").toString() 
						+ "</td><td>" + obj.get("현찰사실때").toString()
						+ "</td><td>"+ obj.get("송금_전신환보내실때").toString()
						+ "</td><td>"+ obj.get("송금_전신환받으실때").toString()
						+ "</td></tr>");			
		}	
	%>
	</table>
</body>
</html>