<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߰�/����</title>
</head>
<body>
	<script>
		const result = confirm("��������� ��� �����Ͱ� �����˴ϴ�. ��� �����Ͻðڽ��ϱ�?");
		if(!result) {
			self.close();
		}
	</script>
	<form action="updatecar.do" method="post" name="f">
	<table class="table">
		<caption>�������� ����</caption>
		<tr>
			<th>���� ����</th>
			<c:if test="${param.cartype==1 }">
				<td>${mem.brand1 } ${mem.carname1 }</td>
				<c:set var="brand" value="brand1" />
				<c:set var="carname" value="carname1" />
				<input type="hidden" name="cartype" value="1">
			</c:if>
			<c:if test="${param.cartype==2 }">
				<td>${mem.brand2 } ${mem.carname2 }</td>
				<c:set var="brand" value="brand2" />
				<c:set var="carname" value="carname2" />
				<input type="hidden" name="cartype" value="2">
			</c:if>
		</tr>
		<tr>
			<th>�귣���</th>
			<td>
				<select name="${brand }">
					<option value=''>��ü</option>
					<option value='����'>����</option>
					<option value='���'>���</option>
					<option value='������(GM���)'>������(GM���)</option>
					<option value='����Ｚ'>����Ｚ</option>
					<option value='�ֿ�'>�ֿ�</option>
					<option value='��︲���ͽ�'>��︲���ͽ�</option>
					<option value='��Ÿ ������'>��Ÿ ������</option>
					<option value='BMW'>BMW</option>
					<option value='����'>����</option>
					<option value='�ƿ��'>�ƿ��</option>
					<option value='�����ٰ�'>�����ٰ�</option>
					<option value='������'>������</option>
					<option value='MINI'>�̴�</option>
					<option value='GM'>GM</option>
					<option value='GMC'>GMC</option>
					<option value='�ֻ�'>�ֻ�</option>
					<option value='�����Ͼ�'>�����Ͼ�</option>
					<option value='����'>����</option>
					<option value='���Ÿ'>���Ÿ</option>
					<option value='��ġ��'>��ġ��</option>
					<option value='���������'>���������</option>
					<option value='����ι�'>����ι�</option>
					<option value='�ι�'>�ι�</option>
					<option value='���ͽ�'>���ͽ�</option>
					<option value='�ѽ����̽�'>�ѽ����̽�</option>
					<option value='����'>����</option>
					<option value='����'>����</option>
					<option value='������Ƽ'>������Ƽ</option>
					<option value='�����'>�����</option>
					<option value='�ƶ�'>�ƶ�</option>
					<option value='��ť��'>��ť��</option>
					<option value='�̾����'>�̾����</option>
					<option value='�����ī'>�����ī</option>
					<option value='��Ʋ��'>��Ʋ��</option>
					<option value='����'>����</option>
					<option value='�ΰ�Ƽ'>�ΰ�Ƽ</option>
					<option value='����'>����</option>
					<option value='���̽���'>���̽���</option>
					<option value='���'>���</option>
					<option value='����'>����</option>
					<option value='������'>������</option>
					<option value='���ٷ�'>���ٷ�</option>
					<option value='����Ű'>����Ű</option>
					<option value='��ī�Ͼ�'>��ī�Ͼ�</option>
					<option value='������Ŀ'>������Ŀ</option>
					<option value='��Ʈ�ο�'>��Ʈ�ο�</option>
					<option value='���ķθ޿�'>���ķθ޿�</option>
					<option value='�ֽ��ϸ�ƾ'>�ֽ��ϸ�ƾ</option>
					<option value='��ť��'>��ť��</option>
					<option value='����'>����</option>
					<option value='������'>������</option>
					<option value='����Ʈ�ʵ�'>����Ʈ�ʵ�</option>
					<option value='�̽���'>�̽���</option>
					<option value='���Ǵ�Ƽ'>���Ǵ�Ƽ</option>
					<option value='��Ծ�'>��Ծ�</option>
					<option value='����'>����</option>
					<option value='ĳ����'>ĳ����</option>
					<option value='�ڴм�ũ'>�ڴм�ũ</option>
					<option value='ũ���̽���'>ũ���̽���</option>
					<option value='�İ���'>�İ���</option>
					<option value='���'>���</option>
					<option value='����'>����</option>
					<option value='������'>������</option>
					<option value='��Ƽ��'>��Ƽ��</option>
					<option value='Ǫ��'>Ǫ��</option>
					<option value='�ǽ�Ŀ'>�ǽ�Ŀ</option>
					<option value='�Ǿ�Ʈ'>�Ǿ�Ʈ</option>
					<option value='���'>���</option>
					<option value='ȥ��'>ȥ��</option>
					<option value='Ȧ��'>Ȧ��</option>
					<option value='�����Է�'>�����Է�</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>������</th>
			<td><input type="text" name="${carname }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="�������� ����"></td>
		</tr>
	</table>
	</form>
</body>
</html>