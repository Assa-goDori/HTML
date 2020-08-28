<%@page import="model.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/list.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
	table, tr, th, td { border:1px solid black; border-collapse: collapse;}
</style>
<title>회원목록보기</title>
</head>
<body>
	<table class="table">
		<caption>회원 목록</caption>
		<tr>
			<th>사진</th>
			<th>아이디</th>
			<th colspan="4">이름</th>
			<th>전화번호</th>
			<th colspan="2">이메일</th>
			<th colspan="6">보유차종1</th>
			<th colspan="6">보유차종2</th>
			<th>등급</th>
			<th>글작성수</th>
			<th>등업신청</th>
			<th colspan="4">등업관리</th>
			<th>비고</th>
		</tr>
		<c:forEach var="m" items="${list }">
			<tr>
				<td><img src="picture/sm_${m.picture }" width="20" height="30"></td>
				<td><a href="info.do?id=${m.id }">${m.id }</a></td>
				<td colspan="4">${m.name}</td>
				<td>${m.tel }</td>
				<td colspan="2">${m.email }</td>
				<td colspan="6">${m.brand1 }<br>${m.carname1 }</td>
				<td colspan="6">${m.brand2 }<br>${m.carname2 }</td>
				<td>${m.rating==3?"일반회원":"고급회원" }</td>
				<td>${m.writecount }</td>
				<td>${m.updown==1?"V":"" }</td>
				<td colspan="4"><a href="up.do?id=${m.id }">[상승]</a> <a href="down.do?id=${m.id }">[하락]</a></td>
				<td>
				<c:if test="${!m.id != 'admin' }">
						<a href="delete.do?id=${m.id }">[강제탈퇴]</a>
				</c:if></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>