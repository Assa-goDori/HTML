<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/loginForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	var nw;
	function inputcheck(f) {
		if(f.id.value=="") {
			alert('id를 입력하세요');
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4) {
			alert('아이디는 4자리 이상 입력하세요');
			f.id.value="";
			f.id.focus();
			return false;
		}
		if(f.pass.value=="") {
			alert('password를 입력하세요');
			f.pass.focus();
			return false;
		}
		return true;
	}
	function open_id_win() {
		nw = open("idForm.jsp","id찾기","width=600,height=350,menubar=no,top=150,left=50");
	}
	function open_pw_win() {
		nw = open("pwForm.jsp","pw찾기","width=600,height=350,menubar=no,top=150,left=50");
	}
</script>
</head>
<body>
	<form action="login.jsp" method="post" name="f" onsubmit="return inputcheck(this)">
		<table>
			<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
				<input type="button" value="아이디찾기" onclick="open_id_win()">
				<input type="button" value="비밀번호찾기" onclick="open_pw_win()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>