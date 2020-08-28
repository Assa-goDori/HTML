<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/updateForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
<script type="text/javascript">
   function  inputcheck(f) {
<c:if test="${sessionScope.login != 'admin'}" >  
     if(f.pass.value == "") {
	   alert("비밀번호를 입력하세요");
	   f.pass.focus();
	   return false;
     }
</c:if>	   
   }
   function win_passchg() {
	  var op = "width=500, height=350, left=150,top=150";
	  open("passwordForm.do","",op);
   }
   function win_upload(){
	   var op = "width=500,height=150,left=150, top=150";
	   open("pictureForm.do","",op);
   }
   function win_carchg(cartype) {
	   var op = "width=500, height=450, left=150,top=150";
	   open("updatecarForm.do?cartype="+cartype,"",op);
   }
   function cardel(cartype) {
	   var op = "width=500, height=450, left=150,top=150";
	   open("deletecar.do?cartype="+cartype,"",op);
   }
</script>
</head>
<body>
	<form action="update.do" name="f" method="post"
		onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${mem.picture}">
		<table class="table">
			<caption>회원 정보 수정</caption>
			<tr>
				<td rowspan="7" valign="bottom">
					<img src="picture/${mem.picture}" width="200" height="210" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">사진수정</a></font>
				</td>
				<th>아이디</th>
				<td><input type="text" name="id" readonly value="${mem.id}"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type="text" name="tel"
					value="${mem.tel}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="text" name="email"
					value="${mem.email}"></td>
			</tr>
			<tr>
				<th>보유차종</th>
				<td colspan="2">
					${mem.brand1 } ${mem.carname1 }
				</td>
				<td>
					<input type="button" value="추가/수정" onclick="win_carchg(1)">
					<input type="button" value="삭제" onclick="cardel(1)">
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">
					${mem.brand2 } ${mem.carname2 }
				</td>
				<td>
					<input type="button" value="추가/수정" onclick="win_carchg(2)">
					<input type="button" value="삭제" onclick="cardel(2)">
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정"> <c:if
						test="${sessionScope.login != 'admin' || mem.id=='admin'}">
						<input type="button" value="비밀번호수정" onclick="win_passchg()">
					</c:if></td>
			</tr>
		</table>
	</form>
</body>
</html>