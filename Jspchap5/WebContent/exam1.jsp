<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String input = request.getParameter("num");
		int sum = 0;
		for(int i = 1; i<=Integer.parseInt(input);i++)
			sum += i;
	%>
	<%=input %>������ �� : <%=sum %>
		
</body>
</html>