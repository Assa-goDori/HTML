<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp
	1. num, pass �Ķ���͸� ������ ����
	2. �Էµ� ��й�ȣ�� DB ��й�ȣ ����
		Ʋ����� : '�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�' �޼��� ��� �� deleteForm.jsp ������ �̵�
	3. �´°�� : �Խñ� ����
		���� ���� : '�Խñ� ���� ����' �޼��� ���, list.jsp ������ �̵�
		���� ���� : '�Խñ� ���� ����' �޼��� ���, info.jsp ������ �̵�
 --%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	Board b = new BoardDao().selectOne(num);
	String msg = "�Խñ� ���� ����";
	String url = "info.jsp";
	
	if(pass.equals(b.getPass())) {
		if(new BoardDao().delete(num)) { 
			msg = "�Խñ� ���� ����";
			url = "list.jsp";
		}
	} else {
		msg = "�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�";
		url = "deleteForm.jsp?num="+b.getNum();
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%= url%>";
</script>