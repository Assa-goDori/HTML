<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model2/board/list.jsp--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� �����Դϴ�</title>
<!-- <link rel="stylesheet" href="../../css/main.css"> -->
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #BDBDBD;}
tr:nth-child(odd) {background-color:#EAEAEA;}
</style>
<script type="text/javascript">
	function listdo(page) {
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
	<form style="text-align: center;" action="list.do" method="post" name="sf">
		<input type="hidden" name="pageNum" value="1">
		<select name="search" >
			<option value="">�����ϼ���</option>
			<option value="subject">����</option>
			<option value="name">�ۼ���</option>
			<option value="content">����</option>
			<option value="subject,name">����+�ۼ���</option>
			<option value="subject,content">����+����</option>
			<option value="name,content">�ۼ���+����</option>
			<option value="subject,name,content">����+�ۼ���+����</option>
		</select>
		<script>document.sf.search.value = "${param.search}";</script>
		<input type="text" name="inputsearch" style="width: 600px;" value="${param.inputsearch }">
		<input type="submit" value="�˻�" >
	</form>
	<table>	
		<caption>�Խ��� ���</caption>
			<c:if test="${boardcount == 0 }" >
				<tr>
					<td colspan = "5">��ϵ� �Խñ��� �����ϴ�.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount != 0 }" >
				<tr>
				<td colspan = "5" style="text-align: right">�� ����:${boardcount }</td>
			</tr>
			<tr>
				<th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�ۼ���</th>
				<th width="17%">�����</th>
				<th width="11%">��ȸ��</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr>
					<td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1 }" />
					<td style="text-align: left">
						<c:choose>
							<c:when test="${!empty b.file1}">
								<a href="file/${b.file1 }" style="text-decoration:none;">@</a>
							</c:when>
							<c:otherwise>
								&nbsp;
							</c:otherwise>
						</c:choose>
						<c:if test="${b.grplevel >0 }">
							<c:forEach begin="1" end="${b.grplevel }">
								&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							��
						</c:if>
						<a href="info.do?num=${b.num }">${b.subject }</a>
					</td>
					<td>${b.name }</td>
					<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd" var="day"/>
					<c:set var="today" value="${today }" />
					<c:choose>
						<c:when test="${day==today }">
							<td><fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" /></td>
						</c:when>
						<c:otherwise>
							<td><fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd HH:mm" /></td>
						</c:otherwise>
					</c:choose>
					<td>${b.readcnt }</td>
				</tr>
			</c:forEach>
			<tr>
				<%-- ������ ó���ϱ� --%>
				<td colspan = "5">	
						<c:if test="${pagenum<=1 }">
							[����]
						</c:if>
						<c:if test="${pagenum>1 }">
							<a href="javascript:listdo(${pagenum-1 })">[����]</a>
						</c:if>
					<c:forEach var="i" begin="${startpage }" end="${endpage }">
						<c:if test="${i==pagenum }">
							[${i }]
						</c:if>
						<c:if test="${i!=pagenum }">
							<a href="javascript:listdo(${i })">[${i }]</a>
						</c:if>
					</c:forEach>
						<c:if test="${pagenum >= maxpage }">
							[����]
						</c:if>
						<c:if test="${pagenum < maxpage }">
							<a href="javascript:listdo(${pagenum+1 })">[����]</a>
						</c:if>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="5" style="text-align: right">
					<a href="writeForm.do">[�۾���]</a>
				</td>
			</tr>
	</table>
</body>
</html>