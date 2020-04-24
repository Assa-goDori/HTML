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
		int kbn = Integer.parseInt(request.getParameter("kbn"));
		int input = Integer.parseInt(request.getParameter("num"));
		int sum = 0;
			for(int i = 1; i<=input;i++) {
				switch(kbn) {
					case 0 : sum+=i; break;
					case 1 : if(i%2==0) sum+=i; break;
					case 2 : if(i%2==1) sum+=i; break;
				}
			}	
	%>
	<%=input %>까지의 <%=(kbn==0)?"":(kbn==1)?"짝수 ":"홀수 " %>합 : <%=sum %>
		
</body>
</html>