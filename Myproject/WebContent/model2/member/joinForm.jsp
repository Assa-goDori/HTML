<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
<link rel="stylesheet" href="../../css/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function inputchk(f) {
		if(f.id.value=="") {
			alert('아이디를 입력하세요');
			f.id.focus();
			return false;
		}
		if(f.ys.value=="") {
			alert("아이디 중복검사 필요");
			f.id.focus();
			return false;
		}
		if(f.ys.value == "used") {
			alert('아이디가 중복입니다.');
			f.id.focus();
			return false;
		}
		if(f.pass.value=="") {
			alert('비밀번호를 입력하세요');
			f.pass.focus();
			return false;
		}
		if(f.name.value=="") {
			alert('이름을 입력하세요');
			f.name.focus();
			return false;
		}
		if(f.tel.value=="") {
			alert('전화번호를 입력하세요');
			f.tel.focus();
			return false;
		}
		if(f.email.value=="") {
			alert('이메일을 입력하세요');
			f.email.focus();
			return false;
		}
		if(f.tel.value=="") {
			alert('전화번호를 입력하세요');
			f.tel.focus();
			return false;
		}
		if(f.brand1.value=="") {
			alert('브랜드를 선택하세요');
			f.brand1.focus();
			return false;
		}
		if(f.carname1.value=="") {
			alert('차종명을 입력하세요');
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
		carlist.innerHTML = "<th colspan='2'>브랜드명</th> <td><select name='brand2'><option value=''>전체</option><option value='현대'>현대</option><option value='기아'>기아</option><option value='쉐보레(GM대우)'>쉐보레(GM대우)</option><option value='르노삼성'>르노삼성</option><option value='쌍용'>쌍용</option><option value='어울림모터스'>어울림모터스</option><option value='기타 국산차'>기타 국산차</option><option value='BMW'>BMW</option><option value='벤츠'>벤츠</option><option value='아우디'>아우디</option><option value='폭스바겐'>폭스바겐</option><option value='MINI'>미니</option><option value='GMC'>GMC</option><option value='닛산'>닛산</option><option value='다이하쓰'>다이하쓰</option><option value='닷지'>닷지</option><option value='토요타'>토요타</option><option value='란치아'>란치아</option><option value='람보르기니'>람보르기니</option><option value='랜드로버'>랜드로버</option><option value='로버'>로버</option><option value='로터스'>로터스</option><option value='롤스로이스'>롤스로이스</option><option value='르노'>르노</option><option value='링컨'>링컨</option><option value='마세라티'>마세라티</option><option value='마쯔다'>마쯔다</option><option value='맥라렌'>맥라렌</option><option value='머큐리'>머큐리</option><option value='미쓰비시'>미쓰비시</option><option value='미쯔오카'>미쯔오카</option><option value='벤틀리'>벤틀리</option><option value='볼보'>볼보</option><option value='부가티'>부가티</option><option value='뷰익'>뷰익</option><option value='비이스만'>비이스만</option><option value='사브'>사브</option><option value='새턴'>새턴</option><option value='스바루'>스바루</option><option value='스즈키'>스즈키</option><option value='스카니아'>스카니아</option><option value='스파이커'>스파이커</option><option value='시트로엥'>시트로엥</option><option value='알파로메오'>알파로메오</option><option value='애스턴마틴'>애스턴마틴</option><option value='어큐라'>어큐라</option><option value='오펠'>오펠</option><option value='올즈모빌'>올즈모빌</option><option value='웨스트필드'>웨스트필드</option><option value='이스즈'>이스즈</option><option value='인피니티'>인피니티</option><option value='재규어'>재규어</option><option value='지프'>지프</option><option value='캐딜락'>캐딜락</option><option value='코닉세크'>코닉세크</option><option value='크라이슬러'>크라이슬러</option><option value='파가니'>파가니</option><option value='페라리'>페라리</option><option value='포드'>포드</option><option value='포르쉐'>포르쉐</option><option value='폰티악'>폰티악</option><option value='푸조'>푸조</option><option value='피스커'>피스커</option><option value='피아트'>피아트</option><option value='허머'>허머</option><option value='혼다'>혼다</option><option value='홀덴'>홀덴</option></select></td> <th>차종명</th><td><input type='text' name='carname2'></td>"
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
				alert("아이디를 입력하세요");
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
				alert("ajax 오류 : " + e.status);
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
					<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
				</td>
				<th>아이디</th>
				<td colspan="3"><input type="text" name="id" id="id">
					<input type="button" id="idchk" value="아이디중복검사">&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="check"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="3"><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th colspan="2">이메일</th>
				<td colspan="3"><input type="text" name="email"></td>
			</tr>
			<tr>
				<th colspan="2">차량대수등록</th>
				<td>
					<input type="radio" id="radio1" onclick="deletecarlist()">1대
					<input type="radio" id="radio2" onclick="showcarlist()">2대
				</td>
			</tr>
			<tr>
				<th colspan="2">브랜드명</th>
				<td>
				<select name="brand1">
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
				</select>
				</td>
				<th>차종명</th>
				<td>
					<input type="text" name="carname1">
				</td>
			</tr>
			<tr id="carlist">
				
			</tr>
			<tr>
				<td colspan="6" align="center">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>