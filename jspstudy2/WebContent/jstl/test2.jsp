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
	<h3>�̸�:${param.name }</h3>
	<h3>����:${param.age }</h3>
	<h3>����:${param.gender==1?"��":"��"}</h3>
	<h3>�������:${param.year }</h3>
	<h3>����:�� ${2020-param.year }��</h3>
</body>
</html>