<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������� �������Դϴ�.</title>
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
			<option value="">�����ϼ���</option>
			<option>2015</option><option>2016</option>
			<option>2017</option><option>2018</option>
			<option>2019</option><option>2020</option>
		</select>
		<select name="m">
			<option value="">�����ϼ���</option>
			<option value="1">1��</option><option value="2">2��</option><option value="3">3��</option>
			<option value="4">4��</option><option value="5">5��</option><option value="6">6��</option>
			<option value="7">7��</option><option value="8">8��</option><option value="9">9��</option>
			<option value="10">10��</option><option value="11">11��</option><option value="12">12��</option>
		</select>
		<select name="chgname">
			<option value="">�����ϼ���</option>
			<c:forEach var="i" items="${rplist }">
				<option>${i.chgname }</option>
			</c:forEach>
		</select>
		<input type="submit" value="�˻�">
		<input type="button" value="��ü����" onclick="allshow()">
		<script>
			document.f.y.value = "${param.y}";
			document.f.m.value = "${param.m}";
			document.f.chgname.value = "${param.chgname}";
		</script>
	</form>
	<table class="table">
		<caption>���� �ǽ� ����</caption>
		<tr>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;�����׸�&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;�ݾ�&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;�Է�����Km&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;��ü�ñ�&nbsp;&nbsp;&nbsp;&nbsp;</th>
		</tr>
		<c:set var="total" value="0" />
		<c:forEach var="b" items="${list }">
			<tr>
			<fmt:formatDate value="${b.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
				<td>${date1 }</td>
				<td><a href="" onclick="window.open('repairinfo.do?no=${b.no}','','width=600,height=550,left=150,top=150')">${b.chgname }</a></td>
				<td><fmt:formatNumber value="${b.repaircost }" pattern="#,###"/>��</td>
				<td><fmt:formatNumber value="${b.inputkm }" pattern="#,###"/>Km</td>
				<td><fmt:formatNumber value="${b.chgdate+b.inputkm }" pattern="#,###"/>Km</td>
				<td></td>
			</tr>
			<c:set var="total" value="${total + b.repaircost }" />
		</c:forEach>
	</table>
	<input type="button" value="�׸��߰�" onclick="repairinsert()">
	<input type="button" value="�����׸��߰�" onclick="repairnameinsert()">
	<br>
	<br>
	<h3>${param.y } ${param.m } ${param.chgname } �� �ݾ� : <fmt:formatNumber value="${total }" pattern="#,###"/> ��</h3>
	<a href="repairmain.do">������������</a>
</body>
</html>