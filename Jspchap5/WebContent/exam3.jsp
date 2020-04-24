<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>계산결과</title>
</head>
<body>
	<%
		double a = Integer.parseInt(request.getParameter("num1"));
		double b = Integer.parseInt(request.getParameter("num2"));
		String op = request.getParameter("op");
		String result="";
		switch(op) {
			case "+" : result=String.format("%d",(int)(a+b)); break;
			case "-" : result=String.format("%d",(int)(a-b)); break;
			case "*" : result=String.format("%d",(int)(a*b)); break;
			case "/" : result=String.format("%.2f",(double)a/b); break;
		}
	%>
	<%=a + op + b %>=<%=result %>
	
</body>
</html>