<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Id ã��</title>
<script type="text/javascript">
	function idsend(id) {
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
	<form>
		<%
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String result = new MemberDao().findId(email, tel);
			if(result == null) { %> 
				<script>
					alert('���̵� �������� �ʽ��ϴ�.');
					history.go(-1);
				</script>
			<% } else { %>
				<h3>���̵� :</h3>	<%=result.substring(0,2)+"**" %>
			<% } %>
		
		<input type="button" value="���̵�����" onclick="idsend('<%=result.substring(0,2) %>')">
	</form>
</body>
</html>