<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>보험금 관리 수정</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="updateins.do?no=${car2.no }" method="post">
	<table class="table">
		<tr>
			<th colspan="2">납입일자</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car2.insurancedate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">납입금액</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.insurancecost }" name="insurancecost"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>