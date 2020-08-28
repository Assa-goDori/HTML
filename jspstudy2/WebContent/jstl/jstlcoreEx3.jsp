<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jstl/jstlcoreEx3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl core �±� : �ݺ���</title>
</head>
<body>
	<h3>�ݺ� ���� �±� : forEach</h3>
	<c:forEach var="test" begin="1" end="10" step="2">
		${test }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>
	<h3>forEach �±׸� �̿��Ͽ� 1���� 100������ �� ���ϱ�</h3>
	<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${sum+i }"/>
		<c:if test="${i%2==0}">
			<c:set var="even_sum" value="${even_sum+i }"/>
		</c:if>
		<c:if test="${i%2==1 }">
			<c:set var="odd_sum" value="${odd_sum+i }"/>
		</c:if>
	</c:forEach>
	1���� 100������ �� : ${sum }<br>
	1���� 100������ ¦���� �� : ${even_sum }<br>
	1���� 100������ Ȧ���� �� : ${odd_sum }<br>
	
	<h3>forEach �±׸� �̿��Ͽ� ������ ����ϱ�</h3>
	<c:forEach var="i" begin="2" end="9">
		<h4>${i }��</h4>
		<c:forEach var="j" begin="1" end="9">
			${i } * ${j } = ${i*j }<br>
		</c:forEach>
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� List ��ü ����ϱ�</h3>
	<%
		List<Integer> list = new ArrayList<Integer>();
		for(int i=1;i<=10;i++) list.add(i*10);
		pageContext.setAttribute("list", list);
	%>
	<c:forEach var="i" items="${list }">
		${i }&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<c:forEach var="i" items="${list }" varStatus="stat">
		<c:if test="${stat.index==0 }">	<%--ù��° ���? --%>
			<h4>forEach �±��� varStatus �Ӽ� ����</h4>
		</c:if>
		[${stat.count}]=${i}&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� Map ��ü ����ϱ�</h3>
	<%
		Map<String,Object> map = new HashMap<>();
		map.put("name","ȫ�浿");
		map.put("today",new Date());
		map.put("age",20);
		pageContext.setAttribute("map", map);
	%>
	<c:forEach var="m" items="${map }" varStatus="stat">
		[${stat.count }]=${m.key } : ${m.value }<br>
	</c:forEach>
	
	<h3>map��ü�� EL�� �̿��Ͽ� ����ϱ�</h3>
		name = ${map.name }<br>
		today = ${map.today }<br>
		age = ${map.age }<br>
		
	<h3>forEach �±׸� �̿��Ͽ� �迭 ��ü ����ϱ�</h3>
	<c:set var="arr" value="<%=new int[] {10,20,30,40,50} %>"/>
	<c:forEach var="i" items="${arr }" varStatus="stat">
		arr[${stat.index }] = ${i }<br>
	</c:forEach>
	${arr[0] }<br>
	${list[0] }<br>
	
	<h3>forEach �±׸� �̿��Ͽ� �迭 ��ü�� �ι�° ��Һ��� ����° ��ұ��� ����ϱ�</h3>
	<c:forEach var="i" items="${arr }" varStatus="stat" begin="1" end="2">
		arr[${stat.index }] = ${i }<br>
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� �迭 ��ü�� ¦����° ��ұ��� ����ϱ�</h3>
	<c:forEach var="i" items="${arr }" varStatus="stat" step="2">
		arr[${stat.index }] = ${i }<br>
	</c:forEach>
	
	<h3>forEach �±׸� �̿��Ͽ� �迭 ��ü�� Ȧ����° ��ұ��� ����ϱ�</h3>
	<c:forEach var="i" items="${arr }" varStatus="stat" begin="1" step="2">
		arr[${stat.index }] = ${i }<br>
	</c:forEach>
</body>
</html>