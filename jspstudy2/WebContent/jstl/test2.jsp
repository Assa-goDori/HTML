<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); %>
	<h3>이름:${param.name }</h3>
	<h3>나이:${param.age }</h3>
	<h3>성별:${param.gender==1?"남":"여"}</h3>
	<h3>출생연도:${param.year }</h3>
	<h3>나이:만 ${2020-param.year }세</h3>
</body>
</html>