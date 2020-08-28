package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardComment;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	protected String id;
	protected String login;
	protected int rating;
	protected int boardtype;
	
	private boolean logincheck(HttpServletRequest request) {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "../../main.do");
			return false;
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "본인 거래만 가능합니다.");
			request.setAttribute("url", "../main/mainForm.do");
			return false;
		}		
		if(id == null || id.trim().equals("")) id=login;
		return true;
	}
	
	private boolean ratingcheck(HttpServletRequest request) {
		rating = (int) request.getSession().getAttribute("rating");
		boardtype = Integer.parseInt(request.getParameter("boardtype"));
		if(rating > 2 && boardtype==1) {	//tip 게시판 등급2부터 boardtype=1
			request.setAttribute("msg", "접근 권한이 없습니다.");
			request.setAttribute("url", "../main/mainForm.do");
			return false;
		}
		return true;
	}

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		String msg = "게시물 등록 실패";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			login = (String)request.getSession().getAttribute("login");
			boardtype = Integer.parseInt(multi.getParameter("boardtype"));
			Board board = new Board();
			board.setId(login);
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
			int num = dao.maxnum();
			board.setNum(++num);
			board.setGrp(num);
			MemberDao mdao = new MemberDao();
			if (dao.insert(board) && mdao.countup(login) > 0) {
				msg = "게시물 등록 성공";
				url = "list.do?boardtype=" + boardtype;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward main(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		List<Board> list = dao.mainlist();
		List<Board> list2 = dao.mainlist2();
		List<Map<String, Integer>> list3 = dao.top5list();
		int limit = 10;
		int pageNum = 1;
		int boardcount1 = dao.boardCount(null,null,0);
		int boardnum1 = boardcount1 - (limit * (pageNum - 1));
		int boardcount2 = dao.boardCount(null,null,1);
		int boardnum2 = boardcount2 - (limit * (pageNum - 1));
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("boardcount1", boardcount1);
		request.setAttribute("boardnum1", boardnum1);
		request.setAttribute("boardcount2", boardcount2);
		request.setAttribute("boardnum2", boardnum2);
		return new ActionForward();
		}
	}
	
	public ActionForward getlist(HttpServletRequest request, HttpServletResponse response) {
		String url = "https://www.radiokorea.com/bulletin/bbs/board.php?bo_table=c_car_talk";
		Document doc = null;
		List<String> list = new ArrayList<String>();	//제목
		List<String> list2 = new ArrayList<String>();	//링크
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".board_list");
			for(Element ele : e1) {
				Elements e2 = ele.select("h3");
				Elements e3 = ele.select(".thumb");
				for(Element ele3 : e3) {
					String href = ele3.attr("href");
					list2.add(href);
				}
				int i = 0;
				for(Element ele2 : e2) {
					String href = ele2.attr("href");
					list.add("<a href='https://www.radiokorea.com/bulletin/bulletin/"+ list2.get(i) + "'>" + ele2.html() + "</a>");
					i++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request) || !ratingcheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) { }
		String search = request.getParameter("search");
		String inputsearch = request.getParameter("inputsearch");
		boardtype = Integer.parseInt(request.getParameter("boardtype"));
		if(search == null || search.trim().equals("")) {
			search = null;
			inputsearch = null;
		}
		if(inputsearch == null || inputsearch.trim().equals("")) {
			search = null;
			inputsearch = null;
		}
		int limit = 10;
		int boardcount = dao.boardCount(search,inputsearch,boardtype);
		List<Board> list = dao.list(pageNum, limit,search, inputsearch,boardtype);
		List<Board> list2 = dao.adminlist(boardtype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (limit * (pageNum - 1));
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("pagenum", pageNum);
		request.setAttribute("today", today);
		return new ActionForward();
		}
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request) || !ratingcheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
			List<BoardComment> list = new ArrayList<BoardComment>();
			int num = Integer.parseInt(request.getParameter("num"));
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
			Board b = dao.selectOne(num, boardtype);
			list = dao.selectComment(num);
			if (request.getRequestURI().contains("board/info.do")) {
				dao.readcntAdd(num);
			}
			request.setAttribute("list", list);
			request.setAttribute("b", b);
			return new ActionForward();
		}
	}
	
	public ActionForward admininfo(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
			List<BoardComment> list = new ArrayList<BoardComment>();
			int num = Integer.parseInt(request.getParameter("num"));
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
			Board b = dao.selectOne2(num, boardtype);
			list = dao.selectComment(num);
			if (request.getRequestURI().contains("board/admininfo.do")) {
				dao.readcntAdd(num);
			}
			request.setAttribute("list", list);
			request.setAttribute("b", b);
			return new ActionForward();
		}
	}

	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		login = (String)request.getSession().getAttribute("login");
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		Board b = new Board();
		b.setId(login);
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		int num = dao.maxnum();
		String msg = "답변등록시 오류 발생";
		String url = "replyForm.do?num=" + b.getNum() + "&boardtype="+boardtype;
		b.setNum(++num);
		b.setGrplevel(grplevel + 1);
		b.setGrpstep(grpstep + 1);
		if (dao.insert(b)) {
			msg = "답변등록 완료";
			url = "list.do?boardtype="+boardtype;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		Board b = new Board();
		String msg = null;
		String url = null;
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "EUC-KR");
			b.setNum(Integer.parseInt(multi.getParameter("num")));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));
			b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
			if (b.getFile1() == null || b.getFile1().equals("")) {
				b.setFile1(multi.getParameter("file2"));
			}
			int boardtype = Integer.parseInt(multi.getParameter("boardtype"));
			MemberDao mdao = new MemberDao();
			String inputpass = multi.getParameter("pass");
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?num=" + b.getNum() +"&boardtype="+boardtype;
			if (mdao.checkpass(multi.getParameter("id")).equals(inputpass)) {
				if (dao.update(b)) { 
					msg = "게시물 수정 완료";
					url = "info.do?num=" + b.getNum()  +"&boardtype="+boardtype;
				} else {
					msg = "게시물 수정 실패";
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		}
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		if(!logincheck(request)) {
			return new ActionForward(false,"../alert.jsp");
		} else {
		String login = (String)request.getSession().getAttribute("login");
		int num = Integer.parseInt(request.getParameter("num"));
		boardtype = Integer.parseInt(request.getParameter("boardtype"));
		String inputpass = request.getParameter("pass");
		String id = request.getParameter("id");
		String msg = "계정 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?num=" + num;
		MemberDao mdao = new MemberDao();
		if(login.equals("admin") && inputpass == null) {
			if(dao.deleteAllComment(null, num) >=0 && dao.delete(num) > 0 && mdao.countdown(id) > 0) {
				msg = "관리자 게시글 삭제 성공";
				url = "list.do?boardtype="+boardtype;
			} else {
				msg = "관리자 게시글 삭제 실패";
				url = "info.do?num=" + num +"&boardtype="+boardtype;
			}
		} else {
			if (mdao.checkpass(login).equals(inputpass)) {
				if (dao.deleteAllComment(null, num) >=0 && dao.delete(num) > 0 && mdao.countdown(login) > 0) {
					msg = "게시글 삭제 성공";
					url = "list.do?boardtype="+boardtype;
				} else {
					msg = "게시글 삭제 실패";
					url = "info.do?num=" + num +"&boardtype="+boardtype;
				}
			}
		}	
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
		}
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/")+"model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	public ActionForward writeComment(HttpServletRequest request, HttpServletResponse respone) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String comment = request.getParameter("comment");
		BoardComment bc = new BoardComment();
		bc.setId(id);
		bc.setNum(num);
		bc.setComment(comment);
		bc.setCregdate(new Date());
		int cnum = dao.Commentmaxnum(num);
		bc.setCnum(++cnum);
		if(dao.insertComment(bc) < 0) {
			String msg = "등록실패";
			String url = "../main/mainForm.do";
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward deleteComment(HttpServletRequest request, HttpServletResponse respone) throws IOException {
		String msg = "댓글삭제실패";
		String url = "../main/mainForm.do";
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int num = Integer.parseInt(request.getParameter("num"));
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		if(dao.deleteComment(cnum) > 0) {
			msg = "댓글삭제성공";
			url = "info.do?boardtype=" + boardtype + "&num=" + num;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}