<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function inputchk(f) {
		if(f.id.value=="") {
			alert('���̵� �Է��ϼ���');
			f.id.focus();
			return false;
		}
		if(f.ys.value=="") {
			alert("���̵� �ߺ��˻� �ʿ�");
			f.id.focus();
			return false;
		}
		if(f.ys.value == "used") {
			alert('���̵� �ߺ��Դϴ�.');
			f.id.focus();
			return false;
		}
		if(f.pass.value=="") {
			alert('��й�ȣ�� �Է��ϼ���');
			f.pass.focus();
			return false;
		}
		if(f.name.value=="") {
			alert('�̸��� �Է��ϼ���');
			f.name.focus();
			return false;
		}
		if(f.tel.value=="") {
			alert('��ȭ��ȣ�� �Է��ϼ���');
			f.tel.focus();
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
		if(f.brand1.value=="") {
			alert('�귣�带 �����ϼ���');
			f.brand1.focus();
			return false;
		}
		if(f.carname1.value=="") {
			alert('�������� �Է��ϼ���');
			f.carname1.focus();
			return false;
		}
		return true;
	}

	function win_upload() {
		var op = "width=500,height=350,left=150, top=150";
		open("pictureForm.do", "", op);
	}
	
	function showcarlist() {
		$("#radio1").removeAttr("checked");
		$("#radio2").attr("checked", "checked");
		carlist.innerHTML = "<th colspan='2'>�귣���</th> <td><select name='brand2'><option value=''>��ü</option><option value='����'>����</option><option value='���'>���</option><option value='������(GM���)'>������(GM���)</option><option value='����Ｚ'>����Ｚ</option><option value='�ֿ�'>�ֿ�</option><option value='��︲���ͽ�'>��︲���ͽ�</option><option value='��Ÿ ������'>��Ÿ ������</option><option value='BMW'>BMW</option><option value='����'>����</option><option value='�ƿ��'>�ƿ��</option><option value='�����ٰ�'>�����ٰ�</option><option value='MINI'>�̴�</option><option value='GMC'>GMC</option><option value='�ֻ�'>�ֻ�</option><option value='�����Ͼ�'>�����Ͼ�</option><option value='����'>����</option><option value='���Ÿ'>���Ÿ</option><option value='��ġ��'>��ġ��</option><option value='���������'>���������</option><option value='����ι�'>����ι�</option><option value='�ι�'>�ι�</option><option value='���ͽ�'>���ͽ�</option><option value='�ѽ����̽�'>�ѽ����̽�</option><option value='����'>����</option><option value='����'>����</option><option value='������Ƽ'>������Ƽ</option><option value='�����'>�����</option><option value='�ƶ�'>�ƶ�</option><option value='��ť��'>��ť��</option><option value='�̾����'>�̾����</option><option value='�����ī'>�����ī</option><option value='��Ʋ��'>��Ʋ��</option><option value='����'>����</option><option value='�ΰ�Ƽ'>�ΰ�Ƽ</option><option value='����'>����</option><option value='���̽���'>���̽���</option><option value='���'>���</option><option value='����'>����</option><option value='���ٷ�'>���ٷ�</option><option value='����Ű'>����Ű</option><option value='��ī�Ͼ�'>��ī�Ͼ�</option><option value='������Ŀ'>������Ŀ</option><option value='��Ʈ�ο�'>��Ʈ�ο�</option><option value='���ķθ޿�'>���ķθ޿�</option><option value='�ֽ��ϸ�ƾ'>�ֽ��ϸ�ƾ</option><option value='��ť��'>��ť��</option><option value='����'>����</option><option value='������'>������</option><option value='����Ʈ�ʵ�'>����Ʈ�ʵ�</option><option value='�̽���'>�̽���</option><option value='���Ǵ�Ƽ'>���Ǵ�Ƽ</option><option value='��Ծ�'>��Ծ�</option><option value='����'>����</option><option value='ĳ����'>ĳ����</option><option value='�ڴм�ũ'>�ڴм�ũ</option><option value='ũ���̽���'>ũ���̽���</option><option value='�İ���'>�İ���</option><option value='���'>���</option><option value='����'>����</option><option value='������'>������</option><option value='��Ƽ��'>��Ƽ��</option><option value='Ǫ��'>Ǫ��</option><option value='�ǽ�Ŀ'>�ǽ�Ŀ</option><option value='�Ǿ�Ʈ'>�Ǿ�Ʈ</option><option value='���'>���</option><option value='ȥ��'>ȥ��</option><option value='Ȧ��'>Ȧ��</option></select></td> <th>������</th><td><input type='text' name='carname2'></td>"
	}
	
	function deletecarlist() {
		$("#radio1").attr("checked", "checked");
		$("#radio2").removeAttr("checked");
		carlist.innerHTML = "";
	}
	
	$(function() {
		$("#idchk").click(function() {
			var id = $("#id").val();
			if(id=="") {
				alert("���̵� �Է��ϼ���");
			} else {
				idcheck(id);
			}
		})
	})
	
	function idcheck(id) {
		$.ajax({
			url:"check.do",
			type:"POST",
			data:"id="+id,
			success : function(data) {
				$("#check").html(data);
				$("#ys").attr("value",data);
			},
			error : function(e) {
				alert("ajax ���� : " + e.status);
			}
		})
	}
</script>
</head>
<body>
	<form action="join.do" name="f" method="post" onsubmit="return inputchk(this)">
		<input type="hidden" name="picture" value="">
		<input type="hidden" id="ys" value="">
		<table class="table">
			<tr>
				<td rowspan="4" valign="bottom">
					<img src="" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">�������</a></font>
				</td>
				<th>���̵�</th>
				<td colspan="3"><input type="text" name="id" id="id">
					<input type="button" id="idchk" value="���̵��ߺ��˻�">&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="check"></div>
				</td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td colspan="3"><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td colspan="3"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td colspan="3"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th colspan="2">�̸���</th>
				<td colspan="3"><input type="text" name="email"></td>
			</tr>
			<tr>
				<th colspan="2">����������</th>
				<td>
					<input type="radio" id="radio1" onclick="deletecarlist()">1��
					<input type="radio" id="radio2" onclick="showcarlist()">2��
				</td>
			</tr>
			<tr>
				<th colspan="2">�귣���</th>
				<td>
				<select name="brand1">
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
				</select>
				</td>
				<th>������</th>
				<td>
					<input type="text" name="carname1">
				</td>
			</tr>
			<tr id="carlist">
				
			</tr>
			<tr>
				<td colspan="6" align="center">
					<input type="submit" value="ȸ������">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>