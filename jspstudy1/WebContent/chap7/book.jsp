<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/jspstudy1/WebContent/chap7/book.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<%--<jsp:useBean id="book" class="chap7.Book" /> == Book book = new Book();
		scope="page" => pageContext.setAttribute(book);
	 --%>
	<jsp:useBean id="book" class="chap7.Book" scope="page"/>	<%-- jsp: <- jsp액션태그, useBean액션태그 --%>
	<%-- property="*" : parameter이름과 property이름이 같은 값을 Book 객체에 저장
		book.setName(request.getParameter("name"))
		book.setName(request.getParameter("title"))
		book.setName(request.getParameter("content"))
		작업을 *로 표현하여 처리
		
		Parameter의 이름을 name->writer로 변경시
		request.getParameter("writer") 같은 이름의 set프로퍼티가 없음. 호출이안되고 null로 표시
		<jsp:setProperty property="writer" param="name" name="book"/>
		<jsp:setProperty property="title"  name="book"/>
		<jsp:setProperty property="content" name="book"/>
	--%>
	<jsp:setProperty property="*" name="book" />
	<table>
		<caption>방명록 조회</caption>
		<tr>	<td>작성자</td><td><jsp:getProperty name="book" property="name"/></td>	</tr>
		<tr>	<td>제목</td><td><jsp:getProperty name="book" property="title"/></td>	</tr>
		<tr>	<td>내용</td><td><jsp:getProperty name="book" property="content"/></td>	</tr>
	</table>
</body>
</html>