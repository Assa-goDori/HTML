<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정비 관리</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertrepair.do" method="POST">
	<table class="table">
		<tr>
			<th>정비일자</th>
		</tr>
		<tr>
			<td><input type="date" name="repairdate"></td>
		</tr>
		<tr>
			<th>정비항목</th>
		</tr>
		<tr>
			<td>
				<select name="repairno">
					<c:forEach var="i" items="${rplist }">
						<option value="${i.repairno }">${i.chgname }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>입력주행Km</th>
		</tr>
		<tr>
			<td><input type="text" name="inputkm"></td>
		</tr>
		<tr>
			<th>금액</th>
		</tr>
		<tr>
			<td><input type="text" name="repaircost"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="추가하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>