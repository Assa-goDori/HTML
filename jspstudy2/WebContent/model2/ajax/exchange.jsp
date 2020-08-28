<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
	list : 통화코드, 환율정보
	list2 : 국가명
	today : 현재 일시
--%>
<h6><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm" />현재</h6>
<table style="border: 1px solid white; border-collapse: collapse;">
	<caption>수출입은행</caption>
	<tr>
		<td colspan="3">${list2[0]}:${list[0]}</td>
	</tr>
	<tr>
		<th>기준율</th>
	</tr>
	<tr>
		<td>${list[3]}</td>
	</tr>
	<tr>
		<th>팔때</th>
	</tr>
	<tr>
		<td>${list[2]}</td>
	</tr>
	<tr>
		<th>받을때</th>
	</tr>
	<tr>
		<td>${list[1]}</td>
	</tr>
</table>