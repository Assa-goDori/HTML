<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/jspstudy1/WebContent/chap9/error.jsp --%>
<%@ page isErrorPage="true" %> <%-- true인 경우만 exception 객체가 전달됨 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>
	<h1>파라미터 name을 입력해주세요</h1>
	<h1>계속 오류 발생시 전산부로 전화 요망</h1>
	<h1>담당자:홍길동, 전화:1234</h1>
	<% //exception.printStackTrace(response.getWriter()); %>
	<!-- 오류 페이지의 출력 용량이 500바이트 미만인 경우 일부 브라우저에서
	현재 페이지가 아닌 http 오류 페이지를 출력함. 그러므로 500바이트 이상이 되도록 오류 페이지의 메세지를 출력해야함.
	이 부분은 500 바이트를 넘기기 위한 메세지임-->
	<!-- 오류 페이지의 출력 용량이 500바이트 미만인 경우 일부 브라우저에서
	현재 페이지가 아닌 http 오류 페이지를 출력함. 그러므로 500바이트 이상이 되도록 오류 페이지의 메세지를 출력해야함.
	이 부분은 500 바이트를 넘기기 위한 메세지임-->
	<!-- 오류 페이지의 출력 용량이 500바이트 미만인 경우 일부 브라우저에서
	현재 페이지가 아닌 http 오류 페이지를 출력함. 그러므로 500바이트 이상이 되도록 오류 페이지의 메세지를 출력해야함.
	이 부분은 500 바이트를 넘기기 위한 메세지임-->
	<!-- 오류 페이지의 출력 용량이 500바이트 미만인 경우 일부 브라우저에서
	현재 페이지가 아닌 http 오류 페이지를 출력함. 그러므로 500바이트 이상이 되도록 오류 페이지의 메세지를 출력해야함.
	이 부분은 500 바이트를 넘기기 위한 메세지임-->
</body>
</html>