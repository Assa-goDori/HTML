<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/forwardex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>forward하는 페이지</title>
</head>
<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<h1>forward 하는 페이지 입니다. 이 내용은 화면에 출력되지 않습니다.</h1>
	<% pageContext.forward("forwardex2.jsp"); %>
	<%--forwardex1.jsp와 forwardex2.jsp는 같은 request영역(하나의 request 객체를 공유)의 jsp페이지이다. --%>
</body>
</html>