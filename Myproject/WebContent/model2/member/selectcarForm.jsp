<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리할 차량을 선택하세요.</title>
</head>
<body>
	<form name="f" method="post" action="selectcar.do">
		<select name="cartype" id="cartype">
			<c:choose>
				<c:when test="${mem.brand1 == null }">
					<option value="2">${mem.brand2 } ${mem.carname2 }</option>
				</c:when>
				<c:when test="${mem.brand2 == null }">
					<option value="1">${mem.brand1 } ${mem.carname1 }</option>
				</c:when>
				<c:otherwise>
					<option value="1">${mem.brand1 } ${mem.carname1 }</option>
					<option value="2">${mem.brand2 } ${mem.carname2 }</option>
				</c:otherwise>
			</c:choose>
		</select>
		<input type="submit" value="선택완료">
	</form>
</body>
</html>