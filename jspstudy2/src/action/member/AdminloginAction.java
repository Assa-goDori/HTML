package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

/*
 * 관리자가 거래인경우 사용되는 추상 클래스
 * 	1. 로그아웃 상태 : 로그인이 필요합니다. 메세지 출력. loginForm.me로 페이지 이동
 * 	2. 로그인 상태 : 
 * 		일반사용자 : 관리자만 가능한 거래입니다. 메세지 출력. main.me로 페이지 이동
 * 	3. 관리자 상태 : 정당한 사용자
 * 		doExecute 메서드 호출
 */
public abstract class AdminloginAction implements Action {
	protected String login;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
		}
		if (!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능한 거래입니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false, "../alert.jsp");
		}
		return doExecute(request, response);
	}

	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
}