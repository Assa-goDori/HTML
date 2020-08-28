<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	table, th, td {border: 1px solid black; border-collapse: collapse;}
</style>
<table>
	<caption>KEB�ϳ�����(${date })</caption>
	<tr>
		<th rowspan="2" style="vertical-align: middle;">�ڵ�</th>
		<th rowspan="2" style="vertical-align: middle;">������</th>
		<th colspan="2">����</th>
	</tr>
	<tr>
		<th>�����ĽǶ�</th>
		<th>������Ƕ�</th>
	</tr>
	<c:forEach var="m" items="${map }">
		<tr>
			<td>${m.key}(${m.value[0] })</td>
			<td>${m.value[1] }</td>
			<td>${m.value[2] }</td>
			<td>${m.value[3] }</td>
		</tr>
	</c:forEach>
</table>