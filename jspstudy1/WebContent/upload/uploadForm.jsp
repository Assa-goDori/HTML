<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp
	파일 업로드시 반드시 enctype="multipart/form-data" 설정해야 함.
		=> 파라미터 정보와 선택한 파일의 내용까지 서버로 전송하도록 설정
		=> method="post"로 설정해야함.(get 불가)
	# 주의사항 #
		=> 파라미터를 받은 upload.jsp 페이지 에서는 request 객체를 사용할 수 없다.
		=> cos.jar 파일에 설정된 MultipartRequest 객체를 사용하여 파라미터정보와 파일의 정보를 사용해야 함.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 예제</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>올린사람</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>