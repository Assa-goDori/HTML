package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   String email = request.getParameter("email");
		   String tel = request.getParameter("tel");
		   MemberDao dao = new MemberDao();
		   String id = dao.idSearch(email,tel);
		   String msg = "정보에 맞는 id를 찾을 수 없습니다.";
		   String url = "idForm.me";
		   if(id != null) { //id 찾은 경우
			   request.setAttribute("id", id);
		   } else {
			   request.setAttribute("msg", msg);
			   request.setAttribute("url", url);
			   return new ActionForward(false, "../alert.jsp");
		   }
		return new ActionForward();
	}
}