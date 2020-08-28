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
<c:set var="data" value="${rs.rows}" />	<%-- ${rs.rows } => list 형태로 리턴 --%>
<c:if test="${!empty data}">	<%--해당 아이디와 비밀번호가 일치하는 경우 --%>
	<h1>반갑습니다. ${data[0].name}님</h1>
</c:if>
<c:if test="${empty data}">		<%--해당 아이디와 비밀번호가 일치하지 않는 경우 --%>
	<h1>아이디와 비밀번호를 확인하세요.</h1>
</c:if>