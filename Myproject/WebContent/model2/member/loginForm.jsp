<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/table.css">
<script type="text/javascript">
	function inputcheck(f) {
		if (f.id.value == '') {
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if (f.pass.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="login.do" method="post" name="f"
		onsubmit="return inputcheck(this)">
		<table class="table">
			<caption>�α���</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�α���"></td>
			</tr>
		</table>
	</form>
</body>
</html>