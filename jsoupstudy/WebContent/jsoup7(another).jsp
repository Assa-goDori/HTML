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
	<%
		String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		String strJson = kebhana.substring(kebhana.indexOf("{"));
		JSONParser jsonParser = new JSONParser();
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
		
		String html = "<table><caption>" + json.get("��¥") + "</caption>" +
					"<tr><th rowspan='2'>��ȭ��</th><th rowspan='2'>�Ÿű�����</th><th colspan='2'>����</th><th colspan='2'>����ȯ�۱�</th></tr>" +
					"<tr><th>�ĽǶ�</th><th>��Ƕ�</th><th>�����Ƕ�</th><th>�����Ƕ�</th></tr>";
		JSONArray array = (JSONArray)json.get("����Ʈ");
		for(int i = 0; i < array.size(); i++) {
			JSONObject obj = (JSONObject)array.get(i);
			html += "<tr><td>" + obj.get("��ȭ��")
						+ "</td><td>" + obj.get("�Ÿű�����")
						+ "</td><td>" + obj.get("�����ĽǶ�") 
						+ "</td><td>" + obj.get("������Ƕ�")
						+ "</td><td>"+ obj.get("�۱�_����ȯ�����Ƕ�")
						+ "</td><td>"+ obj.get("�۱�_����ȯ�����Ƕ�")
						+ "</td></tr>";			
		}
		html += "</table>";
		//out.println(html);
	%>
	<%=html %>
</body>
</html>