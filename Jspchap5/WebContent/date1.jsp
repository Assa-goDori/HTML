<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--2020.04.24 과제 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>날짜를 session에 등록하기</title>
</head>
<body>
	<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
		String today = sf.format(new Date());
		session.setAttribute("date", today);
		out.println("등록된날짜 : " + today + "<br>");
	%>
	<a href="date2.jsp">date2.jsp</a>
</body>
</html>