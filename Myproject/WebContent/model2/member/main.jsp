<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/main.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
	<h3>${sessionScope.login}�ηα��� �Ǿ����ϴ�.</h3>
	<h3>
		<a href="logout.do">�α׾ƿ�</a>
	</h3>
	<h3>
		<a href="info.do?id=${sessionScope.login}">ȸ����������</a>
	</h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<h3>
			<a href="list.do">ȸ����� ����</a>
		</h3>
	</c:if>
</body>
</html>