<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table, th, td {border:1px solid black; border-collapse: collapse;}
</style>
<meta charset="UTF-8">
<title>XML 데이터 처리하기 : 공공데이터에서 데이터 수집</title>
</head>
<body>
	<%
		String serviceKey = "vqvwqgN6%2Fq8tULP9RBlZ3%2BiHyy2X4cm2M6%2BimTAeJ1y9HiH1ECvwfptH26lZp%2F%2FZzKZ7AUpKNVKHqDchKnZ7wg%3D%3D";
		String url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?&ServiceKey=" + serviceKey;
		URL u = new URL(url);
		HttpURLConnection urlcon = (HttpURLConnection)u.openConnection();
		urlcon.setRequestProperty("Accept","application/xml");
		
		Document doc = null;
		String seoulcode = null;
		StringBuilder sb = new StringBuilder();
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
			int len = 0;
			char[] buf = new char[8096];
			while((len = in.read(buf)) != -1) {
				sb.append(new String(buf,0,len));
			}
			doc = Jsoup.parse(sb.toString());
			Elements item = doc.select("item");
			for(Element src : item) {
				if(src.select("orgdownNm").html().equals("서울특별시")) {
					seoulcode = src.select("orgCd").html();
					break;
				}
			}
			//out.println("서울특별시 코드값 : " + seoulcode + "<br>");
			doc = null;
			url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu?upr_cd="+ seoulcode +"&ServiceKey=" + serviceKey;
			u = new URL(url);
			urlcon = (HttpURLConnection)u.openConnection();
			urlcon.setRequestProperty("Accept","application/xml");
			in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
			len = 0;
			buf = new char[8096];
			sb = new StringBuilder();
			while((len = in.read(buf)) != -1) {
				sb.append(new String(buf,0,len));
			}
			doc = Jsoup.parse(sb.toString());
			item = doc.select("item");
			List<String> list = new ArrayList<String>();		//구 코드 담길 리스트
			Map<String, String> map = new HashMap<String, String>();	//(구 코드, 구 이름) 담길 맵
			int j = 0;
			for(Element src : item) {
				if(!src.select("orgdownNm").html().equals("가정보호")) {
					list.add(src.select("orgCd").html());
					map.put(list.get(j), src.select("orgdownNm").html());
					j++;
				}
			}
			Map<String, Map<String,String>> data = new HashMap<>();		//(보호소코드, (보호소명, 지역구))
			for(int i = 0; i<list.size(); i++) {
				url = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter?upr_cd=" + seoulcode + "&org_cd=" + list.get(i) + "&ServiceKey=" + serviceKey;
				u = new URL(url);
				urlcon = (HttpURLConnection)u.openConnection();
				urlcon.setRequestProperty("Accept","application/xml");
				in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
				len = 0;
				buf = new char[8096];
				sb = new StringBuilder();
				while((len = in.read(buf)) != -1) {
					sb.append(new String(buf,0,len));
				}
				System.out.println(new String(sb.toString().getBytes(), "UTF-8"));
				doc = Jsoup.parse(sb.toString());
				item = doc.select("item");
				
				for(Element src : item) {
					Map<String, String> name = new HashMap<>();
					name.put(src.select("careNm").html(), map.get(list.get(i)));
					data.put(src.select("careRegNo").html(), name);
				}
			}
			
			for(Map.Entry<String, Map<String,String>> me : data.entrySet()) {
				out.println("보호소 코드 : " + me.getKey() + " 보호소명 : " + me.getValue().toString().split("=")[0].substring(1) + " 지역구 : " + me.getValue().toString().split("=")[1].substring(0, me.getValue().toString().split("=")[1].indexOf("}")) + "<br>");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>