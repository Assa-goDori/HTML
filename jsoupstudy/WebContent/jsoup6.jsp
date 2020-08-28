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
</head>
<body>
	<%
		//kebhana : ���࿡�� �������� json ������ ����
		String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		String strJson = kebhana.replaceAll("}, ] }", "} ]");
		strJson = strJson.substring(strJson.indexOf("["));
		System.out.println(strJson);
		JSONParser jsonParser = new JSONParser();	//json������
		JSONArray array = (JSONArray)jsonParser.parse(strJson);	//json������ �迭 ��ü�� ����
		float usd = 0f;
		float jpy = 0f;
		float eur = 0f;
		float cny = 0f;
		
		for(int i = 0; i < array.size(); i++) {
			//JSONObject : json ������ ��ü 1�� {"Ű ��" : "value", ...}
			JSONObject obj = (JSONObject)array.get(i);	//array ��� 1�� ����
			//obj.get("��ȭ��") : json ������ key ������ value����
			if(obj.get("��ȭ��").toString().equals("�̱� USD")) {
				usd = Float.parseFloat(obj.get("�Ÿű�����").toString());
				out.println("�̱� USD : " + usd + "<br>");	// out : jsp ���尴ü (��¹��ۿ� �Ἥ ȭ������ ���) 
			} else if (obj.get("��ȭ��").toString().equals("�Ϻ� JPY 100")) {
				jpy = Float.parseFloat(obj.get("�Ÿű�����").toString());
				out.println("�Ϻ� JPY 100 : " + jpy + "<br>");
			} else if (obj.get("��ȭ��").toString().contains("���� EUR")) {
				eur = Float.parseFloat(obj.get("�Ÿű�����").toString());
				out.println("���� EUR : " + eur + "<br>");
			} else if (obj.get("��ȭ��").toString().contains("�߱� CNY")) {
				cny = Float.parseFloat(obj.get("�Ÿű�����").toString());
				out.println("�߱� CNY : " + cny + "<br>");
			}
		}
	%>
</body>
</html>