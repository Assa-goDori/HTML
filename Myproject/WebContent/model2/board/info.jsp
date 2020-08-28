<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function writeComment() {
		var val = "num=" + $("#num").val() + "&id=" + $("#id").val() + "&comment=" + $("#comment").val();
		$.ajax({
			url : "writeComment.do",
			type : "POST",
			data : "num=" + $("#num").val() + "&id=" + $("#id").val() + "&comment=" + $("#comment").val(),
			success : function(data) {
				alert('댓글달기성공');
				document.location.reload();
			},
			error : function(e) {
				alert('ajax 오류 : ' + e.status);
			}
		})
	}
</script>
</head>
<body>
	<table class="table">
		<caption>게시물 상세 보기</caption>
		<tr>
			<th width="20%">아이디</th>
			<td width="80%" style="text-align: left">${b.id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td style="text-align: left">${b.subject }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr>
						<td style="border-width: 0px; vertical-align: top; text-align: left">${b.content }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${empty b.file1 }">
    				&nbsp;
    			</c:if>
    			<c:if test="${!empty b.file1 }">
					<a href="file/${b.file1 }">${b.file1 }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="replyForm.do?num=${b.num }&boardtype=${b.boardtype}">[답변]</a>
				<c:if test="${sessionScope.login == b.id or sessionScope.login == 'admin'}">
					<c:choose>
						<c:when test="${sessionScope.login == 'admin' }">
							<a href="delete.do?num=${b.num }&boardtype=${b.boardtype}&id=${b.id}">[삭제]</a>
						</c:when>
						<c:otherwise>
							<a href="deleteForm.do?num=${b.num }&boardtype=${b.boardtype}">[삭제]</a>
						</c:otherwise>
					</c:choose>
					<a href="updateForm.do?num=${b.num }&boardtype=${b.boardtype}">[수정]</a>
				</c:if>
				<a href="list.do?boardtype=${param.boardtype}">[목록]</a>
			</td>
		</tr>
		<c:forEach var="bc" items="${list }">
		<tr>
			<td width="150">
				<div>
					${bc.id }<br>
					<fmt:formatDate var="date1" value="${bc.cregdate }" pattern="yyyy-MM-dd"/>
					<font size="2" color="lightgray">${date1 }</font>
				</div>
			</td>>
			<td width="550">
				<div class="text_wrapper">
					${bc.comment }
				</div>
			</td>
			<td width="100">
				<div id="btn" style="text-align:center;">
					<c:if test="${sessionScope.login == bc.id or sessionScope.login == 'admin'}">
						<a href="deleteComment.do?cnum=${bc.cnum }&boardtype=${b.boardtype}&num=${b.num}">[삭제]</a>
					</c:if>
				</div>
			</td>
		</tr>
		</c:forEach>
			<tr bgcolor="#F5F5F5">
			<form name="f" action="writeComment.do" method="post">
				<input type="hidden" id="num" name="num" value="${b.num }">
				<input type="hidden" id="id" name="id" value="${sessionScope.login}">
				<td width="150">
					<div>
						${sessionScope.login}
					</div>
				</td>
				<td width="550">
					<div>
						<textarea name="comment" id="comment" rows="4" cols="70"></textarea>
					</div>
				</td>
				<td width="100">
					<div id="btn" style="text-align:center;">
						<input type="button" value="댓글등록" onclick="writeComment()">
					</div>
				</td>
			</form>
			</tr>
	</table>
</body>
</html>