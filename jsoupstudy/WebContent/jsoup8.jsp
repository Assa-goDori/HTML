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
<title>XML ������ ó���ϱ� : ���������Ϳ��� ������ ����</title>
</head>
<body>
	<%
		//String url = "http://openapi.airport.kr/openapi/service/StatusOfPassengerFlights/getPassengerArrivals?serviceKey=vqvwqgN6%2Fq8tULP9RBlZ3%2BiHyy2X4cm2M6%2BimTAeJ1y9HiH1ECvwfptH26lZp%2F%2FZzKZ7AUpKNVKHqDchKnZ7wg%3D%3D";
		String url = "http://openapi.animal.go.kr:80/openapi/service/rest/abandonmentPublicSrvc?_wadl&type=xml?serviceKey=vqvwqgN6%2Fq8tULP9RBlZ3%2BiHyy2X4cm2M6%2BimTAeJ1y9HiH1ECvwfptH26lZp%2F%2FZzKZ7AUpKNVKHqDchKnZ7wg%3D%3D";
		URL u = new URL(url);	//java.net ��Ű���� Ŭ����
		//URLConnection : �߻�Ŭ����(url�� ���ؼ� ���Ӱ�ü�� ������)
		//HttpURLConnection : URLConnectionŬ������ ���� Ŭ����
		HttpURLConnection urlcon = (HttpURLConnection)u.openConnection();	//urlcon : url�� ����(url���� ��ü ����)
		//���ӵ� ��ü�� format ����
		urlcon.setRequestProperty("Accept","application/xml");
		
		String title = "";
		Document doc = null;
		//StringBuilder(������ ����ȭx), StringBuffer(������ ����ȭo) : �������ڿ� vs String : �������ڿ�(��� �����Ͽ� Heap���� ����)
		//xml������ ���� ũ�⸦ ������ �𸣹Ƿ� StringBuilder(�������ڿ�)�� �̿��Ͽ� Heap������ �޸� ���� ����
		StringBuilder sb = new StringBuilder();
		try {
			//urlcon.getInputStream() : ����Ʈ�� �Է½�Ʈ��. ������ url�κ��� �����͸� �Է¹���
			//InputStreamReader : InputStream ���¸� Reader(������ �Է½�Ʈ��)�� ��ȯ -> �������·� �о���Ƿ� ���ڵ������ �������־�� ��.
			BufferedReader in = new BufferedReader(new InputStreamReader(urlcon.getInputStream(),"UTF-8"));
			int len = 0;
			char[] buf = new char[8096];	// �� �⺻ ����ũ�� : 8K
			while((len = in.read(buf)) != -1) {
				sb.append(new String(buf,0,len));
			}
			System.out.println(new String(sb.toString().getBytes(), "UTF-8"));
			//sb �����͸� jsoup�� �̿��Ͽ� xml���� parsing
			doc = Jsoup.parse(sb.toString());
			String html = "<table><caption>�װ��� ���� ����</caption><tr><th>�װ���</th><th>��߰���</th><th>������ڵ�</th><th>�����ð�</th><th>����ð�</th><th>���</th></tr>";
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