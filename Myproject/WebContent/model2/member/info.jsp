<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/info.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 보기</title>
</head>
<body>
	<table class="table">
		<caption>회원 정보 보기</caption>
		<tr>
			<td rowspan="8">
				<img src="picture/${mem.picture}" width="200" height="210">
			</td>
			<th>아이디</th>
			<td>${mem.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${mem.tel}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${mem.email}</td>
		</tr>
		<tr>
			<th>보유차종</th>
			<td>${mem.brand1} ${mem.carname1 }</td>
		</tr>
		<tr>
			<th></th>
			<td>${mem.brand2} ${mem.carname2 }</td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td>
				${mem.rating==3?"일반회원":"고급회원"}
			</td>
		</tr>
		<tr>
			<th>작성글 수</th>
			<td>${mem.writecount }&nbsp;&nbsp;&nbsp;&nbsp;<a href="sendupdown.do?id=${mem.id }">등업신청하기</a></td>
		</tr>
		<tr>
			<td colspan="4"><a href="updateForm.do?id=${mem.id}">[수정]</a> <c:if
					test="${param.id != 'admin' && sessionScope.login != 'admin'}">
					<a href="deleteForm.do?id=${mem.id}">[탈퇴]</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>