<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--2020.04.23 ����--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �۾��� ȭ��</title>
<script type="text/javascript">
	function writer(f) {
		if(f.name.value=="") {
			alert("�͸��� �Ұ��Դϴ�.")
			f.name.focus();
			return false;
		}
		if(f.title.value=="") {
			alert("������ �Է��ϼ���.")
			f.title.focus();
			return false;
		}
		if(f.context.value=="") {
			alert("������ �Է��ϼ���.")
			f.context.focus();
			return false;
		}
		<% 
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String today = sf.format(new Date());
			today = "'"+today+"'";
		%>
		f.time.value = <%=today %>
	}
</script>
</head>
<body>
	<form action="book.jsp" method="post" onsubmit="return writer(this)">
		<input type="hidden" name="time" value="">
		<table>
			<tr>
				<td>�湮��</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="10" cols="50" name="context"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="�۾���"></td>
			</tr>
		</table>
	</form>
</body>
</html>