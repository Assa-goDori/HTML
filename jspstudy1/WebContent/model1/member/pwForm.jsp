<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function inputcheck(f) {
		if(f.id.value=="") {
			alert('���̵� �Է��ϼ���');
			f.id.focus();
			return false;
		}
		if(f.email.value=="") {
			alert('�̸����� �Է��ϼ���');
			f.email.focus();
			return false;
		}
		if(f.tel.value=="") {
			alert('��ȭ��ȣ�� �Է��ϼ���');
			f.tel.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form name="f" method="post" action="pw.jsp" onsubmit="return inputcheck(this)">
		<table>
			<caption>��й�ȣ ã��</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="��й�ȣã��"></td>
			</tr>
		</table>
	</form>
</body>
</html>