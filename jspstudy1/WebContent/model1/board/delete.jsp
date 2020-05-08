<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp
	1. num, pass 파라미터를 변수에 저장
	2. 입력된 비밀번호와 DB 비밀번호 검증
		틀린경우 : '게시글의 비밀번호가 틀렸습니다' 메세지 출력 후 deleteForm.jsp 페이지 이동
	3. 맞는경우 : 게시글 삭제
		삭제 성공 : '게시글 삭제 성공' 메세지 출력, list.jsp 페이지 이동
		삭제 실패 : '게시글 삭제 실패' 메세지 출력, info.jsp 페이지 이동
 --%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	Board b = new BoardDao().selectOne(num);
	String msg = "게시글 삭제 실패";
	String url = "info.jsp";
	
	if(pass.equals(b.getPass())) {
		if(new BoardDao().delete(num)) { 
			msg = "게시글 삭제 성공";
			url = "list.jsp";
		}
	} else {
		msg = "게시글의 비밀번호가 틀렸습니다";
		url = "deleteForm.jsp?num="+b.getNum();
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%= url%>";
</script>