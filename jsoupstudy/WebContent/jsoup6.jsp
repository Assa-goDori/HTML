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
</head>
<body>
	<%
		//kebhana : 은행에서 제공해준 json 데이터 저장
		String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().select("body").text();
		String strJson = kebhana.replaceAll("}, ] }", "} ]");
		strJson = strJson.substring(strJson.indexOf("["));
		System.out.println(strJson);
		JSONParser jsonParser = new JSONParser();	//json번역기
		JSONArray array = (JSONArray)jsonParser.parse(strJson);	//json형태의 배열 객체로 변경
		float usd = 0f;
		float jpy = 0f;
		float eur = 0f;
		float cny = 0f;
		
		for(int i = 0; i < array.size(); i++) {
			//JSONObject : json 형태의 객체 1개 {"키 값" : "value", ...}
			JSONObject obj = (JSONObject)array.get(i);	//array 요소 1개 리턴
			//obj.get("통화명") : json 형태의 key 값으로 value리턴
			if(obj.get("통화명").toString().equals("미국 USD")) {
				usd = Float.parseFloat(obj.get("매매기준율").toString());
				out.println("미국 USD : " + usd + "<br>");	// out : jsp 내장객체 (출력버퍼에 써서 화면으로 출력) 
			} else if (obj.get("통화명").toString().equals("일본 JPY 100")) {
				jpy = Float.parseFloat(obj.get("매매기준율").toString());
				out.println("일본 JPY 100 : " + jpy + "<br>");
			} else if (obj.get("통화명").toString().contains("유로 EUR")) {
				eur = Float.parseFloat(obj.get("매매기준율").toString());
				out.println("유로 EUR : " + eur + "<br>");
			} else if (obj.get("통화명").toString().contains("중국 CNY")) {
				cny = Float.parseFloat(obj.get("매매기준율").toString());
				out.println("중국 CNY : " + cny + "<br>");
			}
		}
	%>
</body>
</html>