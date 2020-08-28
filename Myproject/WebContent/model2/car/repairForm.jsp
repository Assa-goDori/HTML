<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정비관리비 페이지입니다.</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function repairinsert() {
		var op = "width=500, height=550, left=150,top=150";
		open("insertrepairForm.do", "", op);
	}
	function repairnameinsert() {
		var op = "width=500, height=550, left=150,top=150";
		open("insertrepairnameForm.do", "", op);
	}
	function allshow() {
		sf = document.f;
		sf.y.value = "";
		sf.m.value = "";
		sf.chgname.value = "";
		sf.submit();
	}
</script>
</head>
<body>
	<form name="f" method="post" action="repairForm.do?repairtype=1">
		<c:choose>
			<c:when test="${cartype==1 }">
				<h4>${mem.brand1 }${mem.carname1 }</h4>
			</c:when>
			<c:when test="${cartype==2 }">
				<h4>${mem.brand2 }${mem.carname2 }</h4>
			</c:when>
		</c:choose>
		<select name="y">
			<option value="">선택하세요</option>
			<option>2015</option><option>2016</option>
			<option>2017</option><option>2018</option>
			<option>2019</option><option>2020</option>
		</select>
		<select name="m">
			<option value="">선택하세요</option>
			<option value="1">1월</option><option value="2">2월</option><option value="3">3월</option>
			<option value="4">4월</option><option value="5">5월</option><option value="6">6월</option>
			<option value="7">7월</option><option value="8">8월</option><option value="9">9월</option>
			<option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
		</select>
		<select name="chgname">
			<option value="">선택하세요</option>
			<c:forEach var="i" items="${rplist }">
				<option>${i.chgname }</option>
			</c:forEach>
		</select>
		<input type="submit" value="검색">
		<input type="button" value="전체보기" onclick="allshow()">
		<script>
			document.f.y.value = "${param.y}";
			document.f.m.value = "${param.m}";
			document.f.chgname.value = "${param.chgname}";
		</script>
	</form>
	<table class="table">
		<caption>정비 실시 내역</caption>
		<tr>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;정비일자&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;정비항목&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;금액&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;입력주행Km&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;교체시기&nbsp;&nbsp;&nbsp;&nbsp;</th>
		</tr>
		<c:set var="total" value="0" />
		<c:forEach var="b" items="${list }">
			<tr>
			<fmt:formatDate value="${b.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
				<td>${date1 }</td>
				<td><a href="" onclick="window.open('repairinfo.do?no=${b.no}','','width=600,height=550,left=150,top=150')">${b.chgname }</a></td>
				<td><fmt:formatNumber value="${b.repaircost }" pattern="#,###"/>원</td>
				<td><fmt:formatNumber value="${b.inputkm }" pattern="#,###"/>Km</td>
				<td><fmt:formatNumber value="${b.chgdate+b.inputkm }" pattern="#,###"/>Km</td>
				<td></td>
			</tr>
			<c:set var="total" value="${total + b.repaircost }" />
		</c:forEach>
	</table>
	<input type="button" value="항목추가" onclick="repairinsert()">
	<input type="button" value="정비항목추가" onclick="repairnameinsert()">
	<br>
	<br>
	<h3>${param.y } ${param.m } ${param.chgname } 총 금액 : <fmt:formatNumber value="${total }" pattern="#,###"/> 원</h3>
	<a href="repairmain.do">관리메인으로</a>
</body>
</html>