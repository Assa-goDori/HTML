<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/sessionAdd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 추가</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String product = request.getParameter("product");
		//session.getAttribute("cart") : session 객체의 속성중 cart 이름을 가진 속성값을 리턴
		// cart 속성이 없는 경우: null을 리턴(오류발생 X 속성들은 Hashtable(Map)으로 구성됨)
		List<String> cart = (List<String>)session.getAttribute("cart");
		if(cart == null) {	//속성이 등록되지 않는경우
			cart = new ArrayList<String>();
			session.setAttribute("cart", cart);	//속성을 등록
		}
		cart.add(product);
	%>
	<script>
		alert("<%=product%>이(가) 장바구니에 추가되었습니다.")
		history.go(-1);	//뒤로 가기
	</script>
</body>
</html>