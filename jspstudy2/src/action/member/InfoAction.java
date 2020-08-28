package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction{
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		//String id = request.getParameter("id");
		Member mem;
		/*if(id==null) {
			String normal = (String) request.getSession().getAttribute("login");
			mem = new MemberDao().selectOne(normal);
		} else {*/
			mem = new MemberDao().selectOne(id);
		//}
		request.setAttribute("mem",mem);
		return new ActionForward();
	}
}
