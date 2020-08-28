<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정비 관리 수정</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="updaterepair.do?no=${car.no }" method="post">
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
			<td colspan="2">
				<select name="repairno">
					<c:forEach var="i" items="${rplist }"> 
						<option value="${i.repairno }">${i.chgname }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">입력주행Km</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car.inputkm }" name="inputkm"></td>
		</tr>
		<tr>
			<th colspan="2">금액</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" value="${car.repaircost }" name="repaircost"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>