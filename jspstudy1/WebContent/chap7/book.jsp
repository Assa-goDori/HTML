<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/jspstudy1/WebContent/chap7/book.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<%--<jsp:useBean id="book" class="chap7.Book" /> == Book book = new Book();
		scope="page" => pageContext.setAttribute(book);
	 --%>
	<jsp:useBean id="book" class="chap7.Book" scope="page"/>	<%-- jsp: <- jsp�׼��±�, useBean�׼��±� --%>
	<%-- property="*" : parameter�̸��� property�̸��� ���� ���� Book ��ü�� ����
		book.setName(request.getParameter("name"))
		book.setName(request.getParameter("title"))
		book.setName(request.getParameter("content"))
		�۾��� *�� ǥ���Ͽ� ó��
		
		Parameter�� �̸��� name->writer�� �����
		request.getParameter("writer") ���� �̸��� set������Ƽ�� ����. ȣ���̾ȵǰ� null�� ǥ��
		<jsp:setProperty property="writer" param="name" name="book"/>
		<jsp:setProperty property="title"  name="book"/>
		<jsp:setProperty property="content" name="book"/>
	--%>
	<jsp:setProperty property="*" name="book" />
	<table>
		<caption>���� ��ȸ</caption>
		<tr>	<td>�ۼ���</td><td><jsp:getProperty name="book" property="name"/></td>	</tr>
		<tr>	<td>����</td><td><jsp:getProperty name="book" property="title"/></td>	</tr>
		<tr>	<td>����</td><td><jsp:getProperty name="book" property="content"/></td>	</tr>
	</table>
</body>
</html>