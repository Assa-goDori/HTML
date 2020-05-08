<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp 
	1. 파라미터 정보들을 Board 객체에 저장
	2. 비밀번호 검증
		- 비밀번호 일치 하는 경우
			파라미터의 내용으로 해당 게시물의 내용을 수정하기.
			첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장하기
		- 비밀번호가 일치하지 않는 경우
			'비밀번호 오류' 메세지 출력하고, updateForm.jsp 페이지 이동
	3. 수정성공 : '수정 성공' 메세지 출력하고, info.jsp 페이지 이동
		수정실패 : '수정 실패' 메세지 출력하고, updateForm.jsp 페이지 이동
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
	//b2 : 수정 전 정보 저장. 비밀번호 검증시 사용
	Board b2 = new BoardDao().selectOne(b.getNum());
	String msg = "게시물 수정 실패";
	String url = "updateForm.jsp?num="+b.getNum();
	
	if(b.getPass().equals(b2.getPass())) {	
		int update = new BoardDao().update(b);
		if(update>0) {
			msg = "게시물 수정 성공";
			url = "info.jsp?num="+b.getNum();
		}
	} else {
		msg = "비밀번호 오류";
	}
%>

<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>