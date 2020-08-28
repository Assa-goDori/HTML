<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<table class="table">
		<tr>
			<th colspan="2">��������</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">�����׸�</th>
		</tr>
		<tr>
			<td colspan="2">${car.chgname }</td>
		</tr>
		<tr>
			<th colspan="2">�Է�����Km</th>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber value="${car.inputkm }" pattern="#,###"/>Km</td>
		</tr>
		<tr>
			<th colspan="2">�ݾ�</th>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber value="${car.repaircost }" pattern="#,###"/>��</td>
		</tr>
		<tr>
			<td><a href="updaterepairForm.do?no=${car.no }">�����ϱ�</a></td>
			<td><a href="deleterepair.do?no=${car.no }">����</a></td>
		</tr>
	</table>
</body>
</html>