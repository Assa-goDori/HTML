<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/info.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<table class="table">
		<caption>ȸ�� ���� ����</caption>
		<tr>
			<td rowspan="8">
				<img src="picture/${mem.picture}" width="200" height="210">
			</td>
			<th>���̵�</th>
			<td>${mem.id}</td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<th>��ȭ��ȣ</th>
			<td>${mem.tel}</td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td>${mem.email}</td>
		</tr>
		<tr>
			<th>��������</th>
			<td>${mem.brand1} ${mem.carname1 }</td>
		</tr>
		<tr>
			<th></th>
			<td>${mem.brand2} ${mem.carname2 }</td>
		</tr>
		<tr>
			<th>ȸ�����</th>
			<td>
				${mem.rating==3?"�Ϲ�ȸ��":"���ȸ��"}
			</td>
		</tr>
		<tr>
			<th>�ۼ��� ��</th>
			<td>${mem.writecount }&nbsp;&nbsp;&nbsp;&nbsp;<a href="sendupdown.do?id=${mem.id }">�����û�ϱ�</a></td>
		</tr>
		<tr>
			<td colspan="4"><a href="updateForm.do?id=${mem.id}">[����]</a> <c:if
					test="${param.id != 'admin' && sessionScope.login != 'admin'}">
					<a href="deleteForm.do?id=${mem.id}">[Ż��]</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>