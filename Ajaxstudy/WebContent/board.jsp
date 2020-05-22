<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/classdb" user="scott" password="1234" />
<sql:query var="rs" dataSource="${conn}">
	select * from board where ${param.column} like ?
	<sql:param>%${param.find }%</sql:param>
	<%--
	select * from
	<c:if test='${!empty param.name }'>
		where name like ?
		<sql:param>%${param.name }%</sql:param>
	</c:if>
	<c:if test='${!empty param.subject }'>
		where subject like ?
		<sql:param>%${param.subject }%</sql:param>
	</c:if>
	<c:if test='${!empty param.content }'>
		where content like ?
		<sql:param>%${param.content }%</sql:param>
	</c:if>
	--%>
</sql:query>
<table border="1" style="border-collapse: collapse;">
	<tr>
		<th>��ȣ</th>
		<th>�۾���</th>
		<th>����</th>
		<th>����</th>
		<th>�����</th>
		<th>��ȸ��</th>
	</tr>
	<c:forEach var="data" items="${rs.rows }">
		<tr>
			<td>${data.num }</td>
			<td>${data.name }</td>
			<td>${data.subject }</td>
			<%-- <td>
				<c:set var="content" value="${fn:escapeXml(data.content)}"/>
				${fn:substring(content,0,50)}
				<c:if test="${fn:length(content)>50}">...</c:if>
			</td> --%>
			<td><c:out value="${data.content}"/></td>
			<%--�±װ� ������� �ʰ� �����ϰ� ó�� �ϴ� ��� : 1.escapeXml function��� 2. c:out �±� ��� --%>
			<td>${data.regdate }</td>
			<td>${data.readcnt }</td>
		</tr>
	</c:forEach>
</table>