<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/loginForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	var nw;
	function inputcheck(f) {
		if(f.id.value=="") {
			alert('id�� �Է��ϼ���');
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4) {
			alert('���̵�� 4�ڸ� �̻� �Է��ϼ���');
			f.id.value="";
			f.id.focus();
			return false;
		}
		if(f.pass.value=="") {
			alert('password�� �Է��ϼ���');
			f.pass.focus();
			return false;
		}
		return true;
	}
	function open_id_win() {
		nw = open("idForm.jsp","idã��","width=600,height=350,menubar=no,top=150,left=50");
	}
	function open_pw_win() {
		nw = open("pwForm.jsp","pwã��","width=600,height=350,menubar=no,top=150,left=50");
	}
</script>
</head>
<body>
	<form action="login.jsp" method="post" name="f" onsubmit="return inputcheck(this)">
		<table>
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
				<td colspan="2">
				<input type="submit" value="�α���">
				<input type="button" value="ȸ������" onclick="location.href='joinForm.jsp'">
				<input type="button" value="���̵�ã��" onclick="open_id_win()">
				<input type="button" value="��й�ȣã��" onclick="open_pw_win()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>