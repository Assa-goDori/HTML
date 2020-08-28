<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ÿ������ �������Դϴ�.</title>
<script type="text/javascript">
	function othersinsert() {
		var op = "width=500, height=550, left=150,top=150";
		open("insertothersForm.do", "", op);
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
	<form name="f" method="post" action="othersForm.do?repairtype=4">
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

		<input type="submit" value="�˻�">
		<input type="button" value="��ü����" onclick="allshow()">
	</form>
	<table class="table">
		<caption>��Ÿ ���� ����</caption>
		<tr>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;�����ݾ�&nbsp;&nbsp;&nbsp;&nbsp;</th>
		</tr>
		<c:set var="total" value="0" />
		<c:forEach var="b" items="${list }">
			<tr>
			<fmt:formatDate value="${b.repairdate }" pattern="yyyy-MM-dd" var="date1"/>
				<td>${date1 }</td>
				<td><a href="" onclick="window.open('othersinfo.do?no=${b.no}','','width=600,height=550,left=150,top=150')">${b.repairname }</a></td>
				<td><fmt:formatNumber value="${b.repaircost }" pattern="#,###"/>��</td>
				<td></td>
			</tr>
			<c:set var="total" value="${total + b.repaircost }" />
		</c:forEach>
	</table>
	<input type="button" value="�׸��߰�" onclick="othersinsert()">
	<br>
	<br>
	<h3>${param.y } ${param.m } �� �ݾ� : <fmt:formatNumber value="${total }" pattern="#,###"/> ��</h3>
	<a href="repairmain.do">������������</a>
</body>
</html>