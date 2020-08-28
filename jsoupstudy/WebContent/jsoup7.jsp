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
<title>JSON ������ ó���ϱ�</title>
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
			<th rowspan="2">��ȭ��</th>
			<th rowspan="2">�Ÿű�����</th>
			<th colspan="2">����</th>
			<th colspan="2">����ȯ�۱�</th>
		</tr>
		<tr>
			<th>�ĽǶ�</th>
			<th>��Ƕ�</th>
			<th>�����Ƕ�</th>
			<th>�����Ƕ�</th>
		</tr>
	
	<%
		String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		String strJson = kebhana.replaceAll("}, ] }", "} ]");
		strJson = strJson.substring(strJson.indexOf("["));
		JSONParser jsonParser = new JSONParser();
		JSONArray array = (JSONArray)jsonParser.parse(strJson);

		for(int i = 0; i < array.size(); i++) {
			JSONObject obj = (JSONObject)array.get(i);

			out.println("<tr><td>" + obj.get("��ȭ��").toString()
						+ "</td><td>" + obj.get("�Ÿű�����").toString()
						+ "</td><td>" + obj.get("�����ĽǶ�").toString() 
						+ "</td><td>" + obj.get("������Ƕ�").toString()
						+ "</td><td>"+ obj.get("�۱�_����ȯ�����Ƕ�").toString()
						+ "</td><td>"+ obj.get("�۱�_����ȯ�����Ƕ�").toString()
						+ "</td></tr>");			
		}	
	%>
	</table>
</body>
</html>