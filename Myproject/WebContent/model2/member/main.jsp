<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/main.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 관리</title>
</head>
<body>
	<h3>${sessionScope.login}로로그인 되었습니다.</h3>
	<h3>
		<a href="logout.do">로그아웃</a>
	</h3>
	<h3>
		<a href="info.do?id=${sessionScope.login}">회원정보보기</a>
	</h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<h3>
			<a href="list.do">회원목록 보기</a>
		</h3>
	</c:if>
</body>
</html>