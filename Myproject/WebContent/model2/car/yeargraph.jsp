<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:forEach var="map" items="${list}" varStatus="stat1">
		<c:forEach var="a" items="${map }" varStatus="stat2">
			<c:if test="${a.key == 't' }">{</c:if>
			<c:if test="${a.key != 't' }">,</c:if>
			"${a.key}":"${a.value }"
			<c:if test="${a.key != 't' }">}</c:if>
		</c:forEach>
		<c:if test="${stat1.count < list.size() }">,</c:if>
	</c:forEach>
]