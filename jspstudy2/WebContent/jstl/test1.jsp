<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL�� �̿��� ������ ����</title>
</head>
<body>
	<form method="post" name="f">
		x : <input type="text" name="x" value="${param.x }">
			<select name="op">
				<option>+</option>
				<option>-</option>
				<option>*</option>
				<option>/</option>
			</select>
			<script>
				var op = '${param.op}'
				if(op=='') op = '+';
				document.f.op.value=op;
			</script>
		y : <input type="text" name="y" value="${param.y }">
		<input type="submit" value="="><br>
	</form>
	<h3>
	<c:choose>
		<c:when test = "${param.op=='+'}">
			${param.x } ${param.op } ${param.y } = ${param.x+param.y}
		</c:when>
		<c:when test = "${param.op=='-'}">
			${param.x } ${param.op } ${param.y } = ${param.x-param.y}
		</c:when>
		<c:when test = "${param.op=='*'}">
			${param.x } ${param.op } ${param.y } = ${param.x*param.y}
		</c:when>
		<c:when test = "${param.op=='/'}">
			${param.x } ${param.op } ${param.y } = ${param.x/param.y}
		</c:when>
	</c:choose>
	</h3>
</body>
</html>