<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp
	1. �� ������ �� 10���� �Խù� ����ϱ�.
		pageNum �Ķ���� �� ���� => ���°�� 1�� �����ϱ�.
	2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
	3. DB���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���.
		�Խù� ��� �κ�
		������ ���� ��� �κ�
--%>
<%
	int pageNum = 1;	//��������ȣ �ʱ�ȭ
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch (NumberFormatException e) { }
	int limit = 10;		// �� �������� ����� �Խù� �Ǽ�
	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount();	//��ϵ� ��ü �Խù��� �Ǽ�
	//list : ȭ�鿡 ����� �Խñ� ��� ����
	List<Board> list = dao.list(pageNum,limit);
	/*
		maxpage : �� ������ ����
			ex) 21�� => 3������
				boardcount = 21.0
				/	   limit = 10
				------------------
							2.1
				+			0.95
				------------------
							3.05
						=> (int)(3.05) = 3������
	*/
	int maxpage = (int)((double)boardcount/limit + 0.95);
	/*
		startpage : ȭ�鿡 ��µ� ù��° ������ ��ȣ
		pageNum : ���� ������
		
		���� ������ : 2
		2/10.0 + 0.9 => 0.2 + 0.9 => (int)(1.1) => (1 - 1) * 10 +1 => 1
		���� ������ : 1
		
		���� ������ : 10
		10/10.0 + 0.9 => 1.0 + 0.9 => (int)(1.9) = > (1 - 1) * 10 +1 => 1
		���� ������ : 1
		
		���� ������ : 11
		11/10.0 + 0.9 => 1.1 + 0.9 => (int)(2.0) = > (2 - 1) * 10 +1 => 11
		���� ������ : 11
	*/
	int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;	//���� ������ ��ȣ
	int endpage = startpage + 9;
	if(endpage > maxpage) endpage = maxpage;
	int boardnum = boardcount-(limit*(pageNum-1));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>�Խ��� ���</caption>
		<% if(boardcount == 0) { //��ϵ� �Խù� ���� %>
			<tr>
				<td colspan = "5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		<% } else {	//��ϵ� �Խù� ���� %>
			<tr>
				<td colspan = "5" style="text-align: right">�� ����:<%=boardcount %></td>
			</tr>
			<tr>
				<th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�ۼ���</th>
				<th width="17%">�����</th>
				<th width="11%">��ȸ��</th>
			</tr>
			<% for(Board b : list) { %>
				<tr>
					<td><%=boardnum-- %></td>
					<td style="text-align: left">
						<%if(b.getFile1() != null && !b.getFile1().trim().equals("")) { %>
							<a href="file/<%=b.getFile1()%>" style="text-decoration:none;">@</a>
						<% } else { %>
							&nbsp;
						<% } %>
						<%if(b.getGrplevel()>0) { %>
							<% for(int i = 0; i<b.getGrplevel(); i++) { %>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<% } %>
							��
						<% } %>
						<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject() %></a>
					</td>
					<td><%=b.getName() %></td>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
						SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm");
						if(b.getRegdate().getDate() == new Date().getDate()) { %>
							<td><%=sdf.format(b.getRegdate()) %></td>
						<% } else { %>
							<td><%=sdf2.format(b.getRegdate()) %></td>
						<% } %>
					<td><%=b.getReadcnt() %></td>
				</tr>
			<% } //�Խñ� ��ȸ �� %>
			<tr>
				<%-- ������ ó���ϱ� --%>
				<td colspan = "5">
					<% if (pageNum <= 1) { %>[����]
					<% } else { %>
					<a href="list.jsp?pageNum=<%=pageNum-1 %>">[����]</a>
					<% } %>
					<% for(int a=startpage; a<=endpage; a++) {%>
						<% if (a==pageNum) { %> [<%=a %>]
						<% } else { %>
							<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
						<% } %>
					<% } %>
					<% if(pageNum >= maxpage) { %>[����]
					<% } else { %>
						<a href="list.jsp?pageNum=<%=pageNum+1 %>">[����]</a>
					<% } %>
				</td>
			</tr>
		<% } //��ϵ� �Խù� ���� ó�� �� %>
			<tr>
				<td colspan="5" style="text-align: right">
					<a href="writeForm.jsp">[�۾���]</a>
				</td>
			</tr>
	</table>
</body>
</html>