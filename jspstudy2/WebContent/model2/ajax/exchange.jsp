<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
	list : ��ȭ�ڵ�, ȯ������
	list2 : ������
	today : ���� �Ͻ�
--%>
<h6><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm" />����</h6>
<table style="border: 1px solid white; border-collapse: collapse;">
	<caption>����������</caption>
	<tr>
		<td colspan="3">${list2[0]}:${list[0]}</td>
	</tr>
	<tr>
		<th>������</th>
	</tr>
	<tr>
		<td>${list[3]}</td>
	</tr>
	<tr>
		<th>�ȶ�</th>
	</tr>
	<tr>
		<td>${list[2]}</td>
	</tr>
	<tr>
		<th>������</th>
	</tr>
	<tr>
		<td>${list[1]}</td>
	</tr>
</table>