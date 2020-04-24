<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/examForm2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자까지의 합 구하기</title>
<script type="text/javascript">
/*
 * f : form 객체
 * kbn : 0, 1, 2 중 하나 값
 */
	function inputcheck(f,kbn) {
		//숫자 값이 입력안되면 '숫자를 입력하세요' 메세지 출력하고, 입력 focus를 입력칸으로 설정하기
		if(f.num.value=="") {
			alert('숫자를 입력하세요');
			f.num.focus();
			return false;
		}
		if(isNaN(f.num.value)) {
			alert('숫자만 입력하세요');
			f.num.focus();
			f.num.value="";
			return false;
		}
		f.kbn.value=kbn;
		f.submit();	// submit 발생, 이벤트 발생 안됨
					// exam2.jsp 페이지 form이 가지고 있는 input(num, kbn)값을 가지고 이동
	}
</script></head>
<body>
	<form action="exam2.jsp" method="post">
		<input type="hidden" name="kbn" value="0">
		<input type="text" name="num">까지의 합 구하기
		<input type="button" value="전체합계" onclick="inputcheck(this.form,0)">
		<input type="button" value="짝수합계" onclick="inputcheck(this.form,1)">
		<input type="button" value="홀수합계" onclick="inputcheck(this.form,2)">
	</form>
</body>
</html>