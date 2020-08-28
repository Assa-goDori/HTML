<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>包府 沥焊</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<table class="table">
		<tr>
			<th colspan="2">包府老磊</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car2.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">包府郴开</th>
		</tr>
		<tr>
			<td colspan="2">${car2.repairname }</td>
		</tr>
		<tr>
			<th colspan="2">包府陛咀</th>
		</tr>
		<tr>
			<td colspan="2">${car2.repaircost }盔</td>
		</tr>
		<tr>
			<td><a href="updateothersForm.do?no=${car2.no }">荐沥窍扁</a></td>
			<td><a href="deleteothers.do?no=${car2.no }">昏力</a></td>
		</tr>
	</table>
</body>
</html>