<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../../css/table.css">
</head>
<body>
<form action="pw.do" method="post">
  <table class="table">
     <tr><th>아이디</th><td><input type="text" name="id"></td></tr>
     <tr><th>이메일</th><td><input type="text" name="email"></td></tr>
     <tr><td colspan="2"><input type="submit" value="임시비밀번호전송"></td></tr>
  </table>	
</form>
</body>
</html>