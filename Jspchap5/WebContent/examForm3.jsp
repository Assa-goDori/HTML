<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm3.jsp
	���ڸ� �Է¹޵��� ����.
	exam3.jsp���� ����� ����ϱ�
	������ ����� �Ҽ��� ���� 2�ڸ������� ����ϱ�--%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
<script type="text/javascript">
	function calc(f, op) {
		if(f.num1.value=="" || f.num2.value=="") {
			alert("���ڸ� �Է��ϼ���")
			if(f.num1.value=="") {
				f.num1.focus();
				return false
			} else {
				f.num2.focus();
				return false
			}
		}
		
		if(isNaN(f.num1.value) || isNaN(f.num2.value)) {
			alert("���ڸ� �Է��ϼ���")
			if(isNaN(f.num1.value)) {
				f.num1.focus();
				f.num1.value="";
				return false
			} else {
				f.num2.focus();
				f.num2.value="";
				return false
			}
		}
		f.op.value = op;
		f.submit();
	}
</script>
</head>
<body>
	<form action="exam3.jsp" method="post">
		���� 1 : <input type="text" name = "num1"><br>
		���� 2 : <input type="text" name = "num2"><br>
		<input type="hidden" name="op" value="0">
		<input type="button" value="+" onclick="calc(this.form,'+')">
		<input type="button" value="-" onclick="calc(this.form,'-')">
		<input type="button" value="*" onclick="calc(this.form,'*')">
		<input type="button" value="/" onclick="calc(this.form,'/')">
	</form>
</body>
</html>