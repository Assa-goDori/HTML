<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<tr>
		<th colspan="2">자동차 소식지</th>
	</tr>
<c:forEach var="l" items="${list }" varStatus="stat">
	<tr>
		<td>${list.get(stat.index)}</td>
	</tr>			
</c:forEach>	
</table>