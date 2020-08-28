<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/el/elEx2.jsp 
	EL(표현언어) : 표현식을 대체하는 언어.
				${값}
				변수값은 표현 못함 => 속성이나 파라미터만 표현 가능
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp의 결과 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test", "pageContext test 속성");
	request.setAttribute("test", "request test 속성");
	application.setAttribute("test", "application test 속성");
%>
<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageContext test 속성값 : <%=pageContext.getAttribute("test") %><br> 
session test 속성값 : <%=session.getAttribute("test") %><br>
session today 속성값 : <%=session.getAttribute("today") %><br>
name 파라미터 값 : <%=request.getParameter("name") %><br>
tel 변수 값 : <%=tel %><br>
tel 속성 값 : <%=pageContext.getAttribute("tel") %><br>
noAttr 속성 값 : <%=pageContext.getAttribute("noAttr") %><br><br>
noparam 파라미터 값 : <%=request.getParameter("noparam") %><br>

<h3>JSP의 EL(표현)을 이용하여 파라미터와 속성값 출력</h3>
test 속성 값 : ${test }<br>
session test 속성 값 : ${sessionScope.test }<br>
today 속성 값 : ${today }<br>
name 파라미터 값 : ${param.name }<br>
tel 변수 값 : EL로 표현 못함. <%=tel %><br>
tel 속성 값 : ${tel }<br>
noAttr 속성 값 : ${noAttr }<br>
noparam 파라미터 값 : ${param.noparam }<br>

<h3>영역을 설정하여 test 속성 값 출력</h3>
\${test }=${test }<br>
\${pageScope.test }=${pageScope.test }<br>
\${requestScope.test }=${requestScope.test }<br>
\${sessionScope.test }=${sessionScope.test }<br>
\${applicationScope.test }=${applicationScope.test }<br>
<%--
	${test} : 영역담당 객체에 저장된 속성 중 이름이 test인 값을 리턴
		1. pageContext 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
		2. 1번이 없으면 request 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
		3. 1,2번이 없으면 session 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
		4. 1,2,3번이 없으면 application 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴
		5. 1,2,3,4번 모두 없으면 null이 아닌 아무 것도 출력하지 않음.(오류발생 X)
	- 직접 영역 담당객체의 속성을 지정하여 출력하기
		pageContext 객체의 속성 중 test 값 : ${pageScope.test}
		request 객체의 속성 중 test 값 : ${requestScope.test}
		session 객체의 속성 중 test 값 : ${sessionScope.test}
		application 객체의 속성 중 test 값 : ${applicationScope.test}
 --%>
</body>
</html>