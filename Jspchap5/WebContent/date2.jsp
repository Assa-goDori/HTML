<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--2020.04.24 ���� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session�� ��ϵ� ��¥�� ��ȸ�ϱ�</title>
</head>
<body>
	<%
		//request.setCharacterEncoding("EUC-KR");
		String today = (String)session.getAttribute("date");
		if(today == null) { %>
	<script type="text/javascript">
		alert("��ϵ� ��¥�� �����ϴ�.");
		history.go(-1);
	</script>
	<% } else {
			out.println("�ݰ����ϴ�. ��ϵȳ�¥ : " + today);
		}
		session.invalidate();
	%>
</body>
</html>