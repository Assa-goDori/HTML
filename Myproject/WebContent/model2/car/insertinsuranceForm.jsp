<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>보험금 납부</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertinsurance.do" method="POST">
	<table class="table">
		<tr>
			<th>납입일자</th>
		</tr>
		<tr>
			<td><input type="date" name="insurancedate"></td>
		</tr>
		<tr>
			<th>보험금액</th>
		</tr>
		<tr>
			<td><input type="text" name="insurancecost"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="추가하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>