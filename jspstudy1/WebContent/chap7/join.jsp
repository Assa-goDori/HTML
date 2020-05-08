<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- jspstudy1/WebContent/chap7/join.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 화면</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<jsp:useBean id="join" class="chap7.Member"/>	
	<jsp:setProperty property="*" name="join"/>
	<%--
		join.setName(request.getParameter("name"));
		...
		join.setAge(Integer.parseInt(request.getParameter("age")));
		자료형을 자동으로 맞춰준다.
	--%>
	<table>
		<caption>회원정보</caption>
		<tr>
			<th>아이디</th>
			<td><jsp:getProperty property="id" name="join"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><jsp:getProperty property="pass" name="join"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><jsp:getProperty property="name" name="join"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%= /*join.getGender()==1?"남자":"여자"*/ join.getGender2()%></td>
		</tr>
		<tr>
			<th>성별</th><%--join.getGender2() --%>
			<td><jsp:getProperty property="gender2" name="join"/></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><jsp:getProperty property="age" name="join"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><jsp:getProperty property="email" name="join"/></td>
		</tr>
	</table>
</body>
</html>