<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/sessionAdd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� �߰�</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String product = request.getParameter("product");
		//session.getAttribute("cart") : session ��ü�� �Ӽ��� cart �̸��� ���� �Ӽ����� ����
		// cart �Ӽ��� ���� ���: null�� ����(�����߻� X �Ӽ����� Hashtable(Map)���� ������)
		List<String> cart = (List<String>)session.getAttribute("cart");
		if(cart == null) {	//�Ӽ��� ��ϵ��� �ʴ°��
			cart = new ArrayList<String>();
			session.setAttribute("cart", cart);	//�Ӽ��� ���
		}
		cart.add(product);
	%>
	<script>
		alert("<%=product%>��(��) ��ٱ��Ͽ� �߰��Ǿ����ϴ�.")
		history.go(-1);	//�ڷ� ����
	</script>
</body>
</html>