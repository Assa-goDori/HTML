<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주유 관리 수정</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="updatefuel.do?no=${car2.no }" method="post">
	<table class="table">
		<tr>
			<th colspan="2">주유일자</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car2.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">주유단가</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.fuelprice }" name="fuelprice"></td>
		</tr>
		<tr>
			<th colspan="2">주유량</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.fuel }" name="fuel"></td>
		</tr>
		<tr>
			<th colspan="2">주유금액</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.tot }" readonly="readonly"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>