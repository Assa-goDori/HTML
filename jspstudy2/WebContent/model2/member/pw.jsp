<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<table>
		<tr>
			<th>비밀번호</th>
			<c:set var="pass" value="${pass }"/>
			<c:set var="len" value="${fn:length(pass) }"/>
			<td>** ${fn:substring(pass,2,len)}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="닫기" onclick="self.close()"></td>
		</tr>
	</table>
</body>
</html>