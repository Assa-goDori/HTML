<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp 
	1. �Ķ���� �������� Board ��ü�� ����
	2. ��й�ȣ ����
		- ��й�ȣ ��ġ �ϴ� ���
			�Ķ������ �������� �ش� �Խù��� ������ �����ϱ�.
			÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ�
		- ��й�ȣ�� ��ġ���� �ʴ� ���
			'��й�ȣ ����' �޼��� ����ϰ�, updateForm.jsp ������ �̵�
	3. �������� : '���� ����' �޼��� ����ϰ�, info.jsp ������ �̵�
		�������� : '���� ����' �޼��� ����ϰ�, updateForm.jsp ������ �̵�
--%>
<%
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "EUC-KR");
	Board b = new Board();
	b.setNum(Integer.parseInt(multi.getParameter("num")));
	b.setName(multi.getParameter("name"));
	b.setPass(multi.getParameter("pass"));
	b.setSubject(multi.getParameter("subject"));
	b.setContent(multi.getParameter("content"));
	b.setFile1(multi.getFilesystemName("file1"));
	if(b.getFile1() == null || b.getFile1().equals("")) {
		b.setFile1(multi.getParameter("file2"));
	}
	//b2 : ���� �� ���� ����. ��й�ȣ ������ ���
	Board b2 = new BoardDao().selectOne(b.getNum());
	String msg = "�Խù� ���� ����";
	String url = "updateForm.jsp?num="+b.getNum();
	
	if(b.getPass().equals(b2.getPass())) {	
		int update = new BoardDao().update(b);
		if(update>0) {
			msg = "�Խù� ���� ����";
			url = "info.jsp?num="+b.getNum();
		}
	} else {
		msg = "��й�ȣ ����";
	}
%>

<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>