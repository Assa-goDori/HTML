<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model1/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
</head>
<body>
	<form action="delete.do" name="f" method="post">
		<input type="hidden" name="num" value="${param.num }"> <input
			type="hidden" name="boardtype" value="${param.boardtype }">
		<table class="table">
			<caption>�Խñ� ���� ȭ��</caption>
			<tr>
				<td>�Խñۺ�й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�Խñۻ���"></td>
			</tr>
		</table>
	</form>
</body>


</html>