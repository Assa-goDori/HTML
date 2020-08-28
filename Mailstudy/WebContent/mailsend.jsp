<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="mail.MailBean"	/>
<jsp:setProperty name="mb" property="*" />
<%
	if(mb.sendMail()) {
		out.println("<center><H2>메일이 발송 되었습니다.</H2>");
		out.println("<HR><a href=mailform.html>메일작성하기</a></center>");
	} else {
		out.println("<script>alert('메일전송 중 문제 발생.');history.go(-1);</script>");
	}
%>