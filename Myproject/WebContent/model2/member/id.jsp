<%@page import="model.MemberDao"%> 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- /WebContent/model2/member/id.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id찾기</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<table class="table">
		<tr>
			<th>아이디</th>
			<c:set var="id" value="${id }"/>
			<td>${fn:substring(id,0,2) }**</td>
		</tr>
	</table>
</body>
</html>
