<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarKeepingBook 차계부</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		cartalk();
	})
	
	function cartalk() {
		$.ajax("getlist.do", {
			success : function(data) {
				$("#list2").append(data);
			},
			error : function(e) {
				alert("ajax 오류 발생 : " + e.status);
			}
		})
	}
</script>
</head>
<body>
<div>
<hr>
	<div id="board1" style="width: 45%; float:left;">
	<h3>자유게시판(일반회원)</h3>
	<table class="table">
		<caption>자유게시판</caption>
			<c:if test="${boardcount1 == 0 }" >
				<tr>
					<td colspan = "5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount1 != 0 }" >
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">아이디</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr>
					<td>${boardnum1}</td><c:set var="boardnum1" value="${boardnum1-1 }" />
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
							└
						</c:if>
						<a href="../board/info.do?boardtype=${b.boardtype }&num=${b.num }">${b.subject }</a>
					</td>
					<td>${b.id }</td>
				</tr>
			</c:forEach>	
			</c:if>
	</table>
	<hr>
		<div id="list1">
			<h3>회원별 인기 브랜드 top5</h3>
			<table class="table">
				<tr>
					<th>순위</th>
					<th>브랜드(총 대수)</th>
				</tr>
				<c:set var="n" value="1" />
				<c:forEach var="t" items="${list3 }">
				<tr>
					<td>${n }</td>
					<td>${t.b }(${t.t }대)</td>
				</tr>
				<c:set var="n" value="${n+1 }"/>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="board2" style="width: 45%; float:right;">
	<h3>유지비 정보 공유 게시판(고급회원)</h3>
	<table class="table">	
		<caption>유지비 정보 공유 게시판</caption>
			<c:if test="${boardcount2 == 0 }" >
				<tr>
					<td colspan = "5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount2 != 0 }" >
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">아이디</th>
			</tr>
			<c:forEach var="b2" items="${list2 }">
				<tr>
					<td>${boardnum2}</td><c:set var="boardnum2" value="${boardnum2-1 }" />
					<td style="text-align: left">
						<c:choose>
							<c:when test="${!empty b2.file1}">
								<a href="file/${b2.file1 }" style="text-decoration:none;">@</a>
							</c:when>
							<c:otherwise>
								&nbsp;
							</c:otherwise>
						</c:choose>
						<c:if test="${b2.grplevel >0 }">
							<c:forEach begin="1" end="${b2.grplevel }">
								&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							└
						</c:if>
						<a href="../board/info.do?boardtype=${b2.boardtype }&num=${b2.num }">${b2.subject }</a>
					</td>
					<td>${b2.id }</td>
				</tr>
			</c:forEach>	
			</c:if>
	</table>
	<hr>
	<div id="list2">
		<h3>자동차 소식지 Car Talk</h3>	
	</div>
	</div>
</div>
</body>
</html>