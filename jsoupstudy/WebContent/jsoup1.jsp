<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup1.jsp --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ�̱ۼ� ���� �̹��� �����ϱ�</title>
</head>
<body>
	<%
		String url = "http://www.hanwhaeagles.co.kr/html/players/player/hitter_view.asp?sGubunCd=PLPPCC&sMSId=P485";
		String line = "";
		String title = "";
		try {
			Document doc = Jsoup.connect(url).get();	//domƮ�� ���·� html�������� ������
			Elements body = doc.select(".personAreaInner > .img");
			for(Element src : body) {
				out.println(src.toString());
				System.out.println(src.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>