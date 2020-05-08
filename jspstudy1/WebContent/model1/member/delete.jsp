<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/delete.jsp 
	1. �α׾ƿ� ���� : '�α��� �ϼ���' �޼��� ��� �� loginForm.jsp ������ �̵�
	2. �Ϲݻ����
		- id �Ķ���� ������ login ������ �ٸ� ��� : '���θ� Ż�� �����մϴ�' �޼��� ��� �� main.jsp ������ �̵�
		- id �Ķ���� ������ login ������ ���� ���
			- id, pass ������ �̿��Ͽ� ��й�ȣ ����
				- ����ġ : '��й�ȣ�� Ʋ���ϴ�' �޼��� ��� �� deleteForm.jsp ������ �̵�
	3. ������
		- id�� admin�� ��� 'Ż�� �Ұ�' �޼��� ��� �� list.jsp ������ �̵�
	4. Ż�� ���� : member DB���� delete ó�� �Ϸ�
		- �Ϲݻ���� : �α׾ƿ� ���� ��, '���� ����' �޼��� ��� �� loginForm.jsp ������ �̵�
		- ������ : '���� ����' �޼��� ��� �� list.jsp ������ �̵�
	5. Ż�� ���� : member DB���� delete ó�� ����
		- �Ϲݻ���� : 'Ż�� ����' �޼��� ��� �� info.jsp ������ �̵�
		- ������ : '���� ����' �޼��� ��� �� list.jsp ������ �̵�
--%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	String url = "";
	String msg = "";
	boolean admin = false;
	boolean normal = false;
	int result = 0;
	if(login==null) {
		msg = "�α��� �ϼ���.";
		url = "loginForm.jsp";
	} 
	
	if(login.equals("admin")) {
		admin = true;
	} else {
		normal = true;
	}
	
	if(admin) {
		if (id.equals("admin")){
			msg = "Ż�� �Ұ�";
			url = "list.jsp";
		} else {
			result = new MemberDao().delete(id);
			if(result > 0) {
				msg = "���� ����";
				url = "list.jsp";
			} else {
				msg = "���� ����";
				url = "list.jsp";
			}
		}
	}
	
	if(normal) {
		if(!id.equals(login)) {
			msg = "���θ� Ż�� �����մϴ�";
			url = "main.jsp";
		} else {
			Member mem = new MemberDao().selectOne(id);
			if(!pass.equals(mem.getPass())) {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
				url = "deleteForm.jsp?id="+mem.getId();
			} else {
				result = new MemberDao().delete(id);
				if(result > 0) {
					session.removeAttribute(login);
					msg = "Ż�� ����";
					url = "loginForm.jsp";
				} else {
					msg = "Ż�� ����";
					url = "info.jsp";
				}
			}
		}
	}
%>

	<script>
		alert("<%=msg%>");
		location.href = "<%=url %>";
	</script>