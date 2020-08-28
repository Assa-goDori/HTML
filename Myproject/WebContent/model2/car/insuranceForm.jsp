<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>보험비 납부관리 페이지입니다.</title>
<script type="text/javascript">
	function insuranceinsert() {
		var op = "width=500, height=550, left=150,top=150";
		open("insertinsuranceForm.do", "", op);
	}
	function allshow() {
		sf = document.f;
		sf.y.value = "";
		sf.m.value = "";
		sf.submit();
	}
</script>
</head>
<body>
	<form name="f" method="post" action="insuranceForm.do?repairtype=3">
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

		<input type="submit" value="검색">
		<input type="button" value="전체보기" onclick="allshow()">
	</form>
	<table class="table">
		<caption>보험금 내역</caption>
		<tr>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;납입일자&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;보험금액&nbsp;&nbsp;&nbsp;&nbsp;</th>
		</tr>
		<c:set var="total" value="0" />
		<c:forEach var="b" items="${list }">
			<tr>
			<fmt:formatDate value="${b.insurancedate }" pattern="yyyy-MM-dd" var="date1"/>
				<td><a href="" onclick="window.open('insuranceinfo.do?no=${b.no}','','width=600,height=550,left=150,top=150')">${date1 }</a></td>
				<td><fmt:formatNumber value="${b.insurancecost }" pattern="#,###"/>원</td>
				<td></td>
			</tr>
			<c:set var="total" value="${total + b.insurancecost }" />
		</c:forEach>
	</table>
	<input type="button" value="항목추가" onclick="insuranceinsert()">
	<br>
	<br>
	<h3>${param.y } ${param.m } 총 금액 : <fmt:formatNumber value="${total }" pattern="#,###"/> 원</h3>
	<a href="repairmain.do">관리메인으로</a>
</body>
</html>