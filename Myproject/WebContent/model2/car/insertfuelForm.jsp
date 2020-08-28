<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주유 관리</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertfuel.do" method="POST">
	<table class="table">
		<tr>
			<th>주유일자</th>
		</tr>
		<tr>
			<td><input type="date" name="repairdate"></td>
		</tr>
		<tr>
			<th>주유단가(1L당 금액)</th>
		</tr>
		<tr>
			<td><input type="text" name="fuelprice"></td>
		</tr>
		<tr>
			<th>주유량(L)</th>
		</tr>
		<tr>
			<td><input type="text" name="fuel"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="추가하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>