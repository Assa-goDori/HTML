<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--2020.04.23 ����--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<style type="text/css">
table {
	border: 3px solid;
	border-collapse: collapse;
}

th, td {
	border: 3px solid #bcbcbc;
}

caption {
	color: #111111;
	font-size: 20px;
}
</style>

</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String context = request.getParameter("context");
		String time = request.getParameter("time");
	%>
	<table>
		<caption>����</caption>
		<tr>
			<th>�湮��</th>
			<td><%=name%></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=title%></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=context%></td>
		</tr>
		<tr>
			<th>�����</th>
			<td><%=time%></td>
		</tr>
	</table>
</body>
</html>