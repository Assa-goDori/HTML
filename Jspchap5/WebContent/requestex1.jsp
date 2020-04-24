<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/requestex1.jsp
	String request.getParameter(�Ķ�����̸�) : �Ķ���� �̸����� ���� �� ���� ����
	String[] request.getParameterValues(�Ķ�����̸�) : �Ķ���� �̸����� ���� ���� �� ����
	Enumeration request.getParameterNames() : ��û ��ü ������ �Ķ������ �̸��鸸 ����
	//���ڵ� ��� ����
		POST��� : request.setCharacterEncoding("EUC-KR") : �Ķ���� �� ��ȸ ���� ó���ؾ� ��
		GET��� : server.xml���� 8080��Ʈ���� URIEncoding="EUC-KR" �߰��ϰ� server restart �ʿ�
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
<%
	//�Ķ���Ϳ� ���� �ѱ� ���ڵ� ��� ����. �ѱ� �Ķ���� ó��.
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String year = request.getParameter("year");
%>
�̸� : <%=name %><br>
���� : <%=age %><br>
���� : <%=gender.equals("1")?"��":"��" %><br>
��� : <%=hobby %><br>
����⵵ : <%=year %><br>
<h3>��� ���� ��� ��ȸ�ϱ�</h3>
��� : 
<%
	String[] hobbies = request.getParameterValues("hobby");
	for(String a : hobbies) {%>
		<%=a %>&nbsp;&nbsp;
<%}%>
<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
	<table>
		<tr><th>�Ķ�����̸�</th><th>�Ķ���Ͱ�</th></tr>
		<%
			//Iterator�� ������ : Enumeration(�ݺ���)
			Enumeration e = request.getParameterNames();
			while(e.hasMoreElements()) {
				String pname = (String)e.nextElement();
				String[] pvalue = request.getParameterValues(pname);
		%>
		<tr><td><%=pname %></td>
			<td><% for(String v : pvalue) {%>
					<%=v %>&nbsp;&nbsp;
				<%} %></td></tr><%} %></table>
</body>
</html>