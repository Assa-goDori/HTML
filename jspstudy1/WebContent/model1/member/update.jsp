<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/list.jsp 
	1. ��� �Ķ���� ������ Member ��ü�� ����
	2. �Էµ� ��й�ȣ�� DB�� ����� ��й�ȣ ��
		- �ٸ� ��� : '��й�ȣ ����'�޼��� ��� �� updateForm.jsp ������ �̵�.
	3. �Ķ���� ������ ������ Member ��ü�� �̿��ؼ� DB������ ����
		int MemberDao.update(Member) �޼��� �̿�
		��� �� 0 ���� : '��������'�޼��� ��� �� updateForm.jsp ������ �̵�
		��� �� 1 �̻� : '��������'�޼��� ��� �� info.jsp ������ �̵�
--%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%
	String login = (String)session.getAttribute("login");
	Member dbmem = new MemberDao().selectOne(mem.getId());
	if(!dbmem.getPass().equals(mem.getPass()) && !login.equals("admin")) { %>
		<script>
			alert('��й�ȣ ����')
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
		</script>
	<% } else { 
		int result = new MemberDao().update(mem);
		if(result<0) { %>
			<script>
				alert('��������')
				location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<% } else { %>
			<script>
				alert('��������')
				location.href="info.jsp?id=<%=mem.getId()%>"
			</script>
	<% }
	}%>