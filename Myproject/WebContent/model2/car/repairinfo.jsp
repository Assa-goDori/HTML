<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정비 정보</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<table class="table">
		<tr>
			<th colspan="2">정비일자</th>
		</tr>
		<tr>
			<fmt:formatDate value="${car.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
			<td colspan="2">${date1 }</td>
		</tr>
		<tr>
			<th colspan="2">정비항목</th>
		</tr>
		<tr>
			<td colspan="2">${car.chgname }</td>
		</tr>
		<tr>
			<th colspan="2">입력주행Km</th>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber value="${car.inputkm }" pattern="#,###"/>Km</td>
		</tr>
		<tr>
			<th colspan="2">금액</th>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber value="${car.repaircost }" pattern="#,###"/>원</td>
		</tr>
		<tr>
			<td><a href="updaterepairForm.do?no=${car.no }">수정하기</a></td>
			<td><a href="deleterepair.do?no=${car.no }">삭제</a></td>
		</tr>
	</table>
</body>
</html>