<%@page import="model.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/list.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
	table, tr, th, td { border:1px solid black; border-collapse: collapse;}
</style>
<title>ȸ����Ϻ���</title>
</head>
<body>
	<table class="table">
		<caption>ȸ�� ���</caption>
		<tr>
			<th>����</th>
			<th>���̵�</th>
			<th colspan="4">�̸�</th>
			<th>��ȭ��ȣ</th>
			<th colspan="2">�̸���</th>
			<th colspan="6">��������1</th>
			<th colspan="6">��������2</th>
			<th>���</th>
			<th>���ۼ���</th>
			<th>�����û</th>
			<th colspan="4">�������</th>
			<th>���</th>
		</tr>
		<c:forEach var="m" items="${list }">
			<tr>
				<td><img src="picture/sm_${m.picture }" width="20" height="30"></td>
				<td><a href="info.do?id=${m.id }">${m.id }</a></td>
				<td colspan="4">${m.name}</td>
				<td>${m.tel }</td>
				<td colspan="2">${m.email }</td>
				<td colspan="6">${m.brand1 }<br>${m.carname1 }</td>
				<td colspan="6">${m.brand2 }<br>${m.carname2 }</td>
				<td>${m.rating==3?"�Ϲ�ȸ��":"���ȸ��" }</td>
				<td>${m.writecount }</td>
				<td>${m.updown==1?"V":"" }</td>
				<td colspan="4"><a href="up.do?id=${m.id }">[���]</a> <a href="down.do?id=${m.id }">[�϶�]</a></td>
				<td>
				<c:if test="${!m.id != 'admin' }">
						<a href="delete.do?id=${m.id }">[����Ż��]</a>
				</c:if></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>