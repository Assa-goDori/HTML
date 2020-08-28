<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>
<c:choose>
	<c:when test="${param.boardtype==0 }">
		자유게시판
	</c:when>
	<c:when test="${param.boardtype==1 }">
		유지비정보 공유게시판
	</c:when>
	</c:choose>
</title>
<script type="text/javascript">
	function listdo(page) {
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
	<form style="text-align: center;" action="list.do?boardtype=${param.boardtype }" method="post" name="sf">
		<%-- <input type="hidden" name="boardtype" value="${param.boardtype }"> --%>
		<input type="hidden" name="pageNum" value="1">
		<select name="search" >
			<option value="">선택하세요</option>
			<option value="subject">제목</option>
			<option value="id">아이디</option>
			<option value="content">내용</option>
			<option value="subject,id">제목+작성자</option>
			<option value="subject,content">제목+내용</option>
			<option value="id,content">작성자+내용</option>
			<option value="subject,id,content">제목+작성자+내용</option>
		</select>
		<script>document.sf.search.value = "${param.search}";</script>
		<input type="text" name="inputsearch" style="width: 600px;" value="${param.inputsearch }">
		<input type="submit" value="검색" >
	</form>
	<table class="table">	
		<caption>
			<c:choose>
				<c:when test="${param.boardtype==0 }">
					자유게시판
				</c:when>
				<c:when test="${param.boardtype==1 }">
					유지비정보 공유게시판
				</c:when>
			</c:choose>
		</caption>
			<c:if test="${boardcount == 0 }" >
				<tr>
					<td colspan = "5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount != 0 }" >
				<tr>
				<td colspan = "5" style="text-align: right">글 개수:${boardcount }</td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">아이디</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>
			</tr>
			<c:forEach var="ab" items="${list2 }">
				<tr>
					<td>공지글</td>
					<td><a href="admininfo.do?num=${ab.num }&boardtype=${ab.boardtype}">${ab.subject }</a></td>
					<td>${ab.id }</td>
					<fmt:formatDate value="${ab.regdate }" pattern="yyyy-MM-dd" var="day2"/>
					<c:set var="today2" value="${today2 }" />
					<c:choose>
						<c:when test="${day2==today2 }">
							<td><fmt:formatDate value="${ab.regdate }" pattern="HH:mm:ss" /></td>
						</c:when>
						<c:otherwise>
							<td><fmt:formatDate value="${ab.regdate }" pattern="yyyy-MM-dd HH:mm" /></td>
						</c:otherwise>
					</c:choose>
					<td>${ab.readcnt }</td>
				</tr>
			</c:forEach>
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
							└
						</c:if>
						<a href="info.do?num=${b.num }&boardtype=${b.boardtype}">${b.subject }</a>
					</td>
					<td>${b.id }</td>
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
				<%-- 페이지 처리하기 --%>
				<td colspan = "5">	
						<c:if test="${pagenum<=1 }">
							[이전]
						</c:if>
						<c:if test="${pagenum>1 }">
							<a href="javascript:listdo(${pagenum-1 })">[이전]</a>
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
							[다음]
						</c:if>
						<c:if test="${pagenum < maxpage }">
							<a href="javascript:listdo(${pagenum+1 })">[다음]</a>
						</c:if>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="5" style="text-align: right">
					<a href="writeForm.do?boardtype=${param.boardtype }">[글쓰기]</a>
				</td>
			</tr>
	</table>
</body>
</html>