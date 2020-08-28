package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id,email,tel);
		String msg = "정보에 맞는 비밀번호를 찾을 수 없습니다.";
		String url = "pwForm.me";
		if(pass!=null) {
			request.setAttribute("pass", pass);
		} else {
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false,"../alert.jsp");
		}
		return new ActionForward();
	}
}