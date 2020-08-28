<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>차량 추가/수정</title>
</head>
<body>
	<script>
		const result = confirm("차량변경시 모든 데이터가 삭제됩니다. 계속 진행하시겠습니까?");
		if(!result) {
			self.close();
		}
	</script>
	<form action="updatecar.do" method="post" name="f">
	<table class="table">
		<caption>보유차종 변경</caption>
		<tr>
			<th>현재 차종</th>
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
			<th>브랜드명</th>
			<td>
				<select name="${brand }">
					<option value=''>전체</option>
					<option value='현대'>현대</option>
					<option value='기아'>기아</option>
					<option value='쉐보레(GM대우)'>쉐보레(GM대우)</option>
					<option value='르노삼성'>르노삼성</option>
					<option value='쌍용'>쌍용</option>
					<option value='어울림모터스'>어울림모터스</option>
					<option value='기타 국산차'>기타 국산차</option>
					<option value='BMW'>BMW</option>
					<option value='벤츠'>벤츠</option>
					<option value='아우디'>아우디</option>
					<option value='폭스바겐'>폭스바겐</option>
					<option value='렉서스'>렉서스</option>
					<option value='MINI'>미니</option>
					<option value='GM'>GM</option>
					<option value='GMC'>GMC</option>
					<option value='닛산'>닛산</option>
					<option value='다이하쓰'>다이하쓰</option>
					<option value='닷지'>닷지</option>
					<option value='토요타'>토요타</option>
					<option value='란치아'>란치아</option>
					<option value='람보르기니'>람보르기니</option>
					<option value='랜드로버'>랜드로버</option>
					<option value='로버'>로버</option>
					<option value='로터스'>로터스</option>
					<option value='롤스로이스'>롤스로이스</option>
					<option value='르노'>르노</option>
					<option value='링컨'>링컨</option>
					<option value='마세라티'>마세라티</option>
					<option value='마쯔다'>마쯔다</option>
					<option value='맥라렌'>맥라렌</option>
					<option value='머큐리'>머큐리</option>
					<option value='미쓰비시'>미쓰비시</option>
					<option value='미쯔오카'>미쯔오카</option>
					<option value='벤틀리'>벤틀리</option>
					<option value='볼보'>볼보</option>
					<option value='부가티'>부가티</option>
					<option value='뷰익'>뷰익</option>
					<option value='비이스만'>비이스만</option>
					<option value='사브'>사브</option>
					<option value='새턴'>새턴</option>
					<option value='쉐보레'>쉐보레</option>
					<option value='스바루'>스바루</option>
					<option value='스즈키'>스즈키</option>
					<option value='스카니아'>스카니아</option>
					<option value='스파이커'>스파이커</option>
					<option value='시트로엥'>시트로엥</option>
					<option value='알파로메오'>알파로메오</option>
					<option value='애스턴마틴'>애스턴마틴</option>
					<option value='어큐라'>어큐라</option>
					<option value='오펠'>오펠</option>
					<option value='올즈모빌'>올즈모빌</option>
					<option value='웨스트필드'>웨스트필드</option>
					<option value='이스즈'>이스즈</option>
					<option value='인피니티'>인피니티</option>
					<option value='재규어'>재규어</option>
					<option value='지프'>지프</option>
					<option value='캐딜락'>캐딜락</option>
					<option value='코닉세크'>코닉세크</option>
					<option value='크라이슬러'>크라이슬러</option>
					<option value='파가니'>파가니</option>
					<option value='페라리'>페라리</option>
					<option value='포드'>포드</option>
					<option value='포르쉐'>포르쉐</option>
					<option value='폰티악'>폰티악</option>
					<option value='푸조'>푸조</option>
					<option value='피스커'>피스커</option>
					<option value='피아트'>피아트</option>
					<option value='허머'>허머</option>
					<option value='혼다'>혼다</option>
					<option value='홀덴'>홀덴</option>
					<option value='수기입력'>수기입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>차종명</th>
			<td><input type="text" name="${carname }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="보유차종 변경"></td>
		</tr>
	</table>
	</form>
</body>
</html>