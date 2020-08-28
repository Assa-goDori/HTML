<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정비 항목 추가</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
	<form name="f" action="insertrepairname.do" method="POST">
	<table class="table">
		<tr>
			<th>현재 정비항목/교체시기</th>
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
			<th>입력항목명</th>
		</tr>
		<tr>
			<td><input type="text" name="chgname"></td>
		</tr>
		<tr>
			<th>교체시기Km</th>
		</tr>
		<tr>
			<td><input type="text" name="chgdate"></td>
		</tr>
		<tr>
			<td><input type="submit" value="추가하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>