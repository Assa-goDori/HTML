<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/list.jsp 
	1. id �Ķ���� ��ȸ
	2. login ���� ��ȸ
		- �α׾ƿ� : '�α����� �ʿ��մϴ�' �޼��� ���. loginForm.jsp ������ �̵�.
	3. �� ������ �ƴѰ���̸鼭 admin�� �ƴ� ���
		- '�� ������ ���� �����մϴ�' �޼��� ���. main.jsp ������ �̵�.
	4. id ������ DB���� �о Member��ü�� ����
	5. Member ��ü�� ȭ�鿡 ���
--%>
<%
	String id = request.getParameter("id");
	String login = (String) (session.getAttribute("login"));
	if (login == null) { %>
		<script>
			alert('�α����� �ʿ��մϴ�.')
			location.href = "loginForm.jsp"
		</script>
	<% } else if (!id.equals(login) && !login.equals("admin")) { %>
		<script>
			alert('�� ������ ���� �����մϴ�.')
			location.href = "main.jsp"
		</script>
	<% } else {
		Member mem = new MemberDao().selectOne(id); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f) {
		<% if(!login.equals("admin")) { %>
			if (f.pass.value == "") {
				alert('��й�ȣ�� �Է��ϼ���.')
				f.pass.focus()
				return false;
			}
	<% } %>
	}
	function win_passchg() {
		open("passwordForm.jsp","pass ����", "width=600,height=350,menubar=no,top=150,left=50");
	}
	function win_chgpic() {
		open("pictureForm.jsp","���� ����", "width=600,height=350,menubar=no,top=150,left=50");
	}
</script>
</head>
<body>
	<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="<%=mem.getPicture() %>">
		<table>
			<caption>ȸ�� ���� ����</caption>
			<tr>
				<td rowspan="4" valign="bottom"><img src="picture/<%=mem.getPicture()%>"
					width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_chgpic()">��������</a></font>
				</td>
				<th>���̵�</th>
				<td><input type="text" name="id" readonly value="<%=mem.getId()%>"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name" value="<%=mem.getName()%>"></td>
			</tr> 
			<tr>
				<td>����</td>
				<td>
					<input type="radio" name="gender" value ="1" <%=mem.getGender() == 1?"checked":""%>>��
					<input type="radio" name="gender" value ="2" <%=mem.getGender() == 2?"checked":""%>>��
				</td>
			</tr>
			<tr>
				<td>��ȭ��ȣ</td>
				<td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="ȸ������">
					<%if(!login.equals("admin") || id.equals("admin")) { %>
					<input type="button" value="��й�ȣ ����" onclick="win_passchg()">
					<% } %>
				</td>
			</tr>
		</table>
		<input type="button" value="�ڷ�" onclick="history.go(-1)">
	</form>
</body>
</html>
<% } %>