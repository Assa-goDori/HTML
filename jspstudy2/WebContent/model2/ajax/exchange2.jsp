<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	table, th, td {border: 1px solid black; border-collapse: collapse;}
</style>
<table>
	<caption>KEB하나은행(${date })</caption>
	<tr>
		<th rowspan="2" style="vertical-align: middle;">코드</th>
		<th rowspan="2" style="vertical-align: middle;">기준율</th>
		<th colspan="2">현찰</th>
	</tr>
	<tr>
		<th>현찰파실때</th>
		<th>현찰사실때</th>
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