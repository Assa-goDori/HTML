<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/login.jsp 
	1. �Ķ���� �� ����
	2. DB�� ������ �о, ���̵�� ��й�ȣ�� ��.
	3. ���̵� ���� ���
		-> ȭ�鿡 '���̵� �����ϴ�.' �޼��� ��� �� loginForm.jsp ������ �̵�.
		��й�ȣ�� Ʋ�� ���
		-> ȭ�鿡 '��й�ȣ�� Ʋ���ϴ�.' �޼��� ��� �� loginForm.jsp ������ �̵�.
		���̵�� ��й�ȣ�� ��ġ
		-> session ��ü�� �α��� ���� ����
		-> ȭ�鿡 'XXX���� �α��� �ϼ̽��ϴ�.' �޼��� ��� ��, main.jsp ������ �̵�.
--%>
<%
	String msg = "���̵� Ȯ���ϼ���.";
	String url = "loginForm.jsp";
	//1. �Ķ���� ����
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//2. DB ���� �б�
	Member mem = new MemberDao().selectOne(id); 
	//3. ���̵�, ��й�ȣ ����
	if(mem != null) {
		if(pass.equals(mem.getPass())) {
			session.setAttribute("login", id);
			msg = mem.getName() + "���� �α��� �ϼ̽��ϴ�.";
			url = "main.jsp";
		} else {
			msg = "��й�ȣ�� Ʋ���ϴ�.";
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>