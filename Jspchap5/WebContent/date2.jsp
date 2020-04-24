<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--2020.04.24 과제 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session에 등록된 날짜를 조회하기</title>
</head>
<body>
	<%
		//request.setCharacterEncoding("EUC-KR");
		String today = (String)session.getAttribute("date");
		if(today == null) { %>
	<script type="text/javascript">
		alert("등록된 날짜가 없습니다.");
		history.go(-1);
	</script>
	<% } else {
			out.println("반갑습니다. 등록된날짜 : " + today);
		}
		session.invalidate();
	%>
</body>
</html>