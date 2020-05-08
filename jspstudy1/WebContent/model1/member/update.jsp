<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/list.jsp 
	1. 모든 파라미터 정보를 Member 객체에 저장
	2. 입력된 비밀번호와 DB에 저장된 비밀번호 비교
		- 다른 경우 : '비밀번호 오류'메세지 출력 후 updateForm.jsp 페이지 이동.
	3. 파라미터 정보를 저장한 Member 객체를 이용해서 DB정보를 수정
		int MemberDao.update(Member) 메서드 이용
		결과 값 0 이하 : '수정실패'메세지 출력 후 updateForm.jsp 페이지 이동
		결과 값 1 이상 : '수정성공'메세지 출력 후 info.jsp 페이지 이동
--%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%
	String login = (String)session.getAttribute("login");
	Member dbmem = new MemberDao().selectOne(mem.getId());
	if(!dbmem.getPass().equals(mem.getPass()) && !login.equals("admin")) { %>
		<script>
			alert('비밀번호 오류')
			location.href="updateForm.jsp?id=<%=mem.getId()%>"
		</script>
	<% } else { 
		int result = new MemberDao().update(mem);
		if(result<0) { %>
			<script>
				alert('수정실패')
				location.href="updateForm.jsp?id=<%=mem.getId()%>"
			</script>
	<% } else { %>
			<script>
				alert('수정성공')
				location.href="info.jsp?id=<%=mem.getId()%>"
			</script>
	<% }
	}%>