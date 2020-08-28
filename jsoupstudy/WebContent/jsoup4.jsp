<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jsoup4.jsp : jsoup2.jsp에서 tr 태그들만 출력하기 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>class 속성으로 조회하기</title>
<style type="text/css">
	table,td,th {border : 2px solid gray; border-collapse: collapse;}
</style>
<%
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
		String line = "";
		Document doc = null;
		List<String> list = new ArrayList<String>();
		try {
			doc = Jsoup.connect(url).get();	//dom트리 형태로 html페이지를 가져옴
			Elements e1 = doc.select(".tc");	//class='tc' 인 모든 태그 불러오기
			for(Element ele : e1) {
				list.add(ele.html());
				System.out.println(ele.html());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		pageContext.setAttribute("list",list);
%>
</head>
<body>
	<table>
		<c:forEach items="${list}" var="v" varStatus="stat">
			<c:choose>
				<c:when test="${stat.index % 7 == 0}">	<%-- 통화코드 --%>
					<tr><td rowspan="6">${v }</td>
				</c:when>
				<c:when test="${stat.index % 7 == 1}">	<%-- 환율정보 --%>
					<td>${v }</td></tr>
				</c:when>
				<c:otherwise>
					<tr><td>${v }</td></tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
</body>
</html>