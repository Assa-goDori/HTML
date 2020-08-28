<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기타 유지비 관리</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertothers.do" method="POST">
	<table class="table">
		<tr>
			<th>관리일자</th>
		</tr>
		<tr>
			<td><input type="date" name="repairdate"></td>
		</tr>
		<tr>
			<th>관리내역</th>
		</tr>
		<tr>
			<td><input type="text" name="repairname"></td>
		</tr>
		<tr>
			<th>관리금액</th>
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