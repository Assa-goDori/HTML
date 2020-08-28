<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/replyForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>
</head>
<body>
	<form action="reply.do" method="post" name="f">
		<input type="hidden" name="num" value="${b.num }">
		<input type="hidden" name="boardtype" value="${b.boardtype }">
		<input type="hidden" name="grp" value="${b.grp }">
		<input type="hidden" name="grplevel" value="${b.grplevel }">
		<input type="hidden" name="grpstep" value="${b.grpstep }">
		<table class="table">
			<caption>게시판 답글 등록</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${sessionScope.login }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"
					value="RE:${b.subject }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15" id="content1"></textarea></td>
			</tr>
			<script>CKEDITOR.replace("content1", {filebrowserImageUploadUrl : "imgupload.do"});</script>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[답변글등록]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>