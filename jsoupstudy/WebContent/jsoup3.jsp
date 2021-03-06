<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup3.jsp : jsoup2.jsp에서 tr 태그들만 출력하기 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Jsoup을 이용하여 크롤링으로 수출입은행 환율 정보 조회하기</title>
<style type="text/css">
	table,td,th {border : 1px solid gray; border-collapse: collapse;}
</style>
<%
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		String line = "";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();	//dom트리 형태로 html페이지를 가져옴
			Elements e1 = doc.select("table");
			for(Element ele : e1) {
				//e2 : tr태그들
				Elements e2 = ele.select("tr");
				for(Element ele2 : e2) {
					String temp = ele2.html();
					System.out.println("==============");
					System.out.println(temp);
					line += "<tr>" + temp + "</tr>";
				}				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
%>
</head>
<body>
	<table><%=line %></table>
</body>
</html>