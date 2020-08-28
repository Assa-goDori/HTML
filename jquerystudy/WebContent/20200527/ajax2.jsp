<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/20200527/ajax2.jsp --%>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/classdb" user="scott" password="1234" />
<sql:query var="rs" dataSource="${conn}">
	select * from member where id = ? and pass = ?
	<sql:param>${param.id}</sql:param>
	<sql:param>${param.pass}</sql:param>
</sql:query>
<c:set var="data" value="${rs.rows}" />	<%-- ${rs.rows } => list ���·� ���� --%>
<c:if test="${!empty data}">	<%--�ش� ���̵�� ��й�ȣ�� ��ġ�ϴ� ��� --%>
	<h1>�ݰ����ϴ�. ${data[0].name}��</h1>
</c:if>
<c:if test="${empty data}">		<%--�ش� ���̵�� ��й�ȣ�� ��ġ���� �ʴ� ��� --%>
	<h1>���̵�� ��й�ȣ�� Ȯ���ϼ���.</h1>
</c:if>