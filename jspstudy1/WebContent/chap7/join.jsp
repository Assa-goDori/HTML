<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- jspstudy1/WebContent/chap7/join.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ȭ��</title>
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
		�ڷ����� �ڵ����� �����ش�.
	--%>
	<table>
		<caption>ȸ������</caption>
		<tr>
			<th>���̵�</th>
			<td><jsp:getProperty property="id" name="join"/></td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td><jsp:getProperty property="pass" name="join"/></td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td><jsp:getProperty property="name" name="join"/></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%= /*join.getGender()==1?"����":"����"*/ join.getGender2()%></td>
		</tr>
		<tr>
			<th>����</th><%--join.getGender2() --%>
			<td><jsp:getProperty property="gender2" name="join"/></td>
		</tr>
		<tr>
			<th>����</th>
			<td><jsp:getProperty property="age" name="join"/></td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td><jsp:getProperty property="email" name="join"/></td>
		</tr>
	</table>
</body>
</html>