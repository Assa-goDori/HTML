<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--2020.04.24 ���� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥�� session�� ����ϱ�</title>
</head>
<body>
	<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
		String today = sf.format(new Date());
		session.setAttribute("date", today);
		out.println("��ϵȳ�¥ : " + today + "<br>");
	%>
	<a href="date2.jsp">date2.jsp</a>
</body>
</html>