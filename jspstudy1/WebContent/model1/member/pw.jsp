<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript">
	function close_win() {
		self.close();
	}
</script>
</head>
<body>
	<form>
		<%
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String result = new MemberDao().findpw(id,email, tel);
			if(result == null) { %>
			<script>
				alert('��й�ȣ�� �������� �ʽ��ϴ�.');
				history.go(-1);
			</script>
		<% } else { %>
			<h3>��й�ȣ :</h3>	<%="**"+result.substring(2,result.length()) %>
		<% } %>
		
		<input type="button" value="�ݱ�" onclick="close_win()">
	</form>
</body>
</html>