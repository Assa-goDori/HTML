<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ÿ ������ ����</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="updateothers.do?no=${car2.no }" method="post">
	<table class="table">
		<tr>
			<th colspan="2">��������</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car2.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">��������</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.repairname }" name="repairname"></td>
		</tr>
		<tr>
			<th colspan="2">�����ݾ�</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car2.repaircost }" name="repaircost"></td>
		</tr>
		<tr>
			<td><input type="submit" value="�����ϱ�"></td>
		</tr>
	</table>
	</form>
</body>
</html>