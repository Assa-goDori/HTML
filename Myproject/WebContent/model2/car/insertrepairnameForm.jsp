<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �׸� �߰�</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertrepairname.do" method="POST">
	<table class="table">
		<tr>
			<th>���� �����׸�/��ü�ñ�</th>
		</tr>
		<tr>
			<td>
				<select name="repairno">
					<c:forEach var="i" items="${rplist }">
						<option value="${i.repairno }">${i.chgname }/${i.chgdate }Km</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>�Է��׸��</th>
		</tr>
		<tr>
			<td><input type="text" name="chgname"></td>
		</tr>
		<tr>
			<th>��ü�ñ�Km</th>
		</tr>
		<tr>
			<td><input type="text" name="chgdate"></td>
		</tr>
		<tr>
			<td><input type="submit" value="�߰��ϱ�"></td>
		</tr>
	</table>
	</form>
</body>
</html>