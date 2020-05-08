<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/delete.jsp 
	1. 로그아웃 상태 : '로그인 하세요' 메세지 출력 후 loginForm.jsp 페이지 이동
	2. 일반사용자
		- id 파라미터 정보와 login 정보가 다른 경우 : '본인만 탈퇴 가능합니다' 메세지 출력 후 main.jsp 페이지 이동
		- id 파라미터 정보와 login 정보가 같은 경우
			- id, pass 정보를 이용하여 비밀번호 검증
				- 불일치 : '비밀번호가 틀립니다' 메세지 출력 후 deleteForm.jsp 페이지 이동
	3. 관리자
		- id가 admin인 경우 '탈퇴 불가' 메세지 출력 후 list.jsp 페이지 이동
	4. 탈퇴 성공 : member DB에서 delete 처리 완료
		- 일반사용자 : 로그아웃 실행 후, '삭제 성공' 메세지 출력 후 loginForm.jsp 페이지 이동
		- 관리자 : '삭제 성공' 메세지 출력 후 list.jsp 페이지 이동
	5. 탈퇴 실패 : member DB에서 delete 처리 오류
		- 일반사용자 : '탈퇴 실패' 메세지 출력 후 info.jsp 페이지 이동
		- 관리자 : '삭제 실패' 메세지 출력 후 list.jsp 페이지 이동
--%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	String url = "";
	String msg = "";
	boolean admin = false;
	boolean normal = false;
	int result = 0;
	if(login==null) {
		msg = "로그인 하세요.";
		url = "loginForm.jsp";
	} 
	
	if(login.equals("admin")) {
		admin = true;
	} else {
		normal = true;
	}
	
	if(admin) {
		if (id.equals("admin")){
			msg = "탈퇴 불가";
			url = "list.jsp";
		} else {
			result = new MemberDao().delete(id);
			if(result > 0) {
				msg = "삭제 성공";
				url = "list.jsp";
			} else {
				msg = "삭제 실패";
				url = "list.jsp";
			}
		}
	}
	
	if(normal) {
		if(!id.equals(login)) {
			msg = "본인만 탈퇴 가능합니다";
			url = "main.jsp";
		} else {
			Member mem = new MemberDao().selectOne(id);
			if(!pass.equals(mem.getPass())) {
				msg = "비밀번호가 틀립니다.";
				url = "deleteForm.jsp?id="+mem.getId();
			} else {
				result = new MemberDao().delete(id);
				if(result > 0) {
					session.removeAttribute(login);
					msg = "탈퇴 성공";
					url = "loginForm.jsp";
				} else {
					msg = "탈퇴 실패";
					url = "info.jsp";
				}
			}
		}
	}
%>

	<script>
		alert("<%=msg%>");
		location.href = "<%=url %>";
	</script>