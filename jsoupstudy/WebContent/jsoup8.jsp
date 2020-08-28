<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table, th, td {border:1px solid black; border-collapse: collapse;}
</style>
<meta charset="EUC-KR">
<title>XML 데이터 처리하기 : 공공데이터에서 데이터 수집</title>
</head>
<body>
	<%
		//String url = "http://openapi.airport.kr/openapi/service/StatusOfPassengerFlights/getPassengerArrivals?serviceKey=vqvwqgN6%2Fq8tULP9RBlZ3%2BiHyy2X4cm2M6%2BimTAeJ1y9HiH1ECvwfptH26lZp%2F%2FZzKZ7AUpKNVKHqDchKnZ7wg%3D%3D";
		String url = "http://openapi.animal.go.kr:80/openapi/service/rest/abandonmentPublicSrvc?_wadl&type=xml?serviceKey=vqvwqgN6%2Fq8tULP9RBlZ3%2BiHyy2X4cm2M6%2BimTAeJ1y9HiH1ECvwfptH26lZp%2F%2FZzKZ7AUpKNVKHqDchKnZ7wg%3D%3D";
		URL u = new URL(url);	//java.net 패키지의 클래스
		//URLConnection : 추상클래스(url을 통해서 접속객체를 가져옴)
		//HttpURLConnection : URLConnection클래스의 하위 클래스
		HttpURLConnection urlcon = (HttpURLConnection)u.openConnection();	//urlcon : url에 접속(url접속 객체 리턴)
		//접속된 객체의 format 설정
		urlcon.setRequestProperty("Accept","application/xml");
		
		String title = "";
		Document doc = null;
		//StringBuilder(스레드 동기화x), StringBuffer(스레드 동기화o) : 동적문자열 vs String : 정적문자열(계속 생성하여 Heap영역 낭비)
		//xml문서가 얼마의 크기를 가질지 모르므로 StringBuilder(동적문자열)을 이용하여 Heap영역의 메모리 낭비를 방지
		StringBuilder sb = new StringBuilder();
		try {
			//urlcon.getInputStream() : 바이트형 입력스트림. 설정된 url로부터 데이터를 입력받음
			//InputStreamReader : InputStream 형태를 Reader(문자형 입력스트림)로 변환 -> 문자형태로 읽어오므로 인코딩방식을 설정해주어야 함.
			BufferedReader in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
			int len = 0;
			char[] buf = new char[8096];	// 웹 기본 버퍼크기 : 8K
			while((len = in.read(buf)) != -1) {
				sb.append(new String(buf,0,len));
			}
			System.out.println(new String(sb.toString().getBytes(), "UTF-8"));
			//sb 데이터를 jsoup을 이용하여 xml문서 parsing
			doc = Jsoup.parse(sb.toString());
			String html = "<table><caption>항공기 도착 정보</caption><tr><th>항공사</th><th>출발공항</th><th>비행기코드</th><th>예정시간</th><th>변경시간</th><th>비고</th></tr>";
			Elements item = doc.select("item");
			for(Element src : item) {
				html += "<tr>" +
						"<td>" + src.select("airline").html() + "</td>" +
						"<td>" + src.select("airport").html() + "</td>" +
						"<td>" + src.select("flightid").html() + "</td>" +
						"<td>" + src.select("scheduledatetime").html() + "</td>" +
						"<td>" + src.select("estimateddatetime").html() + "</td>" +
						"<td>" + src.select("remark").html() + "</td>" +
						"</tr>";
			}
			html += "</table>";
			out.println(html);
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>