<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/jstl/jstlfmtEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL ����ȭ �±� ����</title>
</head>
<body>
	<h3>���� ���� ���� �����ϱ�</h3>
	<fmt:formatNumber value="500000" type="currency" currencySymbol="��"/><br>
	<fmt:formatNumber value="0.15" type="percent"/><br>
	<fmt:formatNumber value="50000.345" pattern="###,###.00"/><br>
	<fmt:setLocale value="en_US"/>	<%--�������� --%>
	<fmt:formatNumber value="500000" type="currency"/><br>
	<fmt:setLocale value="ko_KR"/>
	<fmt:formatNumber value="500000" type="currency"/><br>
	
	<h3>��¥ ���� ���� �����ϱ�</h3>
	<c:set var="today" value="<%=new java.util.Date() %>" />
	�� �� �� : <fmt:formatDate value="${today }" type="date"/><br>
	�� �� �� : <fmt:formatDate value="${today }" type="time"/><br>
	��     �� : <fmt:formatDate value="${today }" type="both"/><br>
	��  ��1 : <fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short"/><br>
	��  ��2 : <fmt:formatDate value="${today }" type="both" timeStyle="long" dateStyle="long"/><br>
	��  ��3 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full"/><br>
	��  ��4 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br>
	��������: <fmt:formatDate value="${today }" pattern="yyyy�� MM�� dd�� a HH:mm:ss E����" /><br>
</body>
</html>