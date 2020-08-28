package action.car;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Car;
import model.CarDao;
import model.Member;
import model.MemberDao;
import model.Repair;

public class CarAllAction {
	private String login;
	private String id;
	List<Car> list = new ArrayList<Car>();
	MemberDao mdao = new MemberDao();
	CarDao cdao = new CarDao();
	
	private boolean logincheck(HttpServletRequest request) {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "../main/mainForm.do");
			return false;
		}
		if (id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "본인 거래만 가능합니다.");
			request.setAttribute("url", "../main/mainForm.do");
			return false;
		}
		if (id == null || id.trim().equals(""))
			id = login;
		return true;
	}
	
	public ActionForward repairmain(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
		
		String id = (String)request.getSession().getAttribute("login");
		Member mem = mdao.selectOne(id);
		request.getSession().setAttribute("mem", mem);
		return new ActionForward();
		}
	}
	
	public ActionForward repairinfo(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		Car car = cdao.selectOne(no);
		Car car2 = cdao.selectOne2(no);
		List<Repair> rplist = cdao.rplist();
		request.setAttribute("rplist", rplist);
		request.setAttribute("car", car);
		request.setAttribute("car2", car2);
		return new ActionForward();
		
	}
	
	public ActionForward repairFormlist(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String y = request.getParameter("y");
		String m = request.getParameter("m");
		String chgname = request.getParameter("chgname");
		if(y==null || y.trim().equals("")) {
			y = null;
		}
		if(m==null || m.trim().equals("")) {
			m = null;
		}
		if(chgname == null || chgname.trim().equals("")) {
			chgname=null;
		}
		String repairtype = request.getParameter("repairtype");
		list = cdao.selectFormlist(id,cartype,repairtype,y,m,chgname);
		List<Repair> rplist = cdao.rplist();
		request.setAttribute("rplist", rplist);
		request.setAttribute("id", id);
		request.setAttribute("cartype", cartype);
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward repairForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		int repairtype = Integer.parseInt(request.getParameter("repairtype"));
		String y = request.getParameter("y");
		String m = request.getParameter("m");
		if(y==null || y.trim().equals("")) {
			y = null;
		}
		if(m==null || m.trim().equals("")) {
			m = null;
		}
		list = cdao.selectlist(id,cartype,repairtype,y,m);	
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward updaterepair(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		int repairno = Integer.parseInt(request.getParameter("repairno"));
		int inputkm = Integer.parseInt(request.getParameter("inputkm"));
		int repaircost = Integer.parseInt(request.getParameter("repaircost"));
		String msg = "오류발생";
		String url = "updaterepairForm.do?no="+no;
		if(cdao.update(no, repairno, inputkm, repaircost) > 0) {
			msg = "수정성공";
			url = "repairForm.do?repairtype=1";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "수정실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward updatefuel(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		int fuelprice = Integer.parseInt(request.getParameter("fuelprice"));
		int fuel = Integer.parseInt(request.getParameter("fuel"));
		int tot = fuelprice*fuel;
		String msg = "오류발생";
		String url = "updatefuelForm.do?no="+no;
		if(cdao.update2(no, fuelprice, fuel, tot) > 0) {
			msg = "수정성공";
			url = "fuelForm.do?repairtype=2";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "수정실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	public ActionForward updateins(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		int insurancecost = Integer.parseInt(request.getParameter("insurancecost"));
		String msg = "오류발생";
		String url = "updateinsForm.do?no="+no;
		if(cdao.update3(no, insurancecost) > 0) {
			msg = "수정성공";
			url = "insuranceForm.do?repairtype=3";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "수정실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	public ActionForward updateothers(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		String repairname = request.getParameter("repairname");
		int repaircost = Integer.parseInt(request.getParameter("repaircost"));
		String msg = "오류발생";
		String url = "updateothersForm.do?no="+no;
		if(cdao.update4(no, repairname, repaircost) > 0) {
			msg = "수정성공";
			url = "othersForm.do?repairtype=4";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "수정실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward deleterepair(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		String msg = "오류발생";
		String url = "updaterepairForm.do?no="+no;
		if(cdao.deleterepair(no) > 0) {
			msg = "삭제성공";
			url = "repairForm.do?repairtype=1";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward deletefuel(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		String msg = "오류발생";
		String url = "updatefuelForm.do?no="+no;
		if(cdao.deleterepair(no) > 0) {
			msg = "삭제성공";
			url = "fuelForm.do?repairtype=2";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward deleteins(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		String msg = "오류발생";
		String url = "updateinsForm.do?no="+no;
		if(cdao.deleterepair(no) > 0) {
			msg = "삭제성공";
			url = "insuranceForm.do?repairtype=3";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	public ActionForward deleteothers(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		int no = Integer.parseInt(request.getParameter("no"));
		String msg = "오류발생";
		String url = "updateothersForm.do?no="+no;
		if(cdao.deleterepair(no) > 0) {
			msg = "삭제성공";
			url = "othersForm.do?repairtype=4";
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alerturl.jsp");
		} else {
			msg = "삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}
	
	
	public ActionForward insertrepairForm(HttpServletRequest request, HttpServletResponse response) {
		List<Repair> rplist = cdao.rplist();
		request.setAttribute("rplist", rplist);
		return new ActionForward();
	}
	
	public ActionForward insertrepair(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String msg = "추가실패";
		String url = "repairForm.do?repairtype=1";
		boolean opener = false;
		boolean closer = false;
		Car car = new Car();
		car.setId(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String repairdate = request.getParameter("repairdate");
		try {
			car.setRepairdate(sdf.parse(repairdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		car.setCartype(cartype);
		car.setRepairno(Integer.parseInt(request.getParameter("repairno")));
		car.setInputkm(Integer.parseInt(request.getParameter("inputkm")));
		car.setRepaircost(Integer.parseInt(request.getParameter("repaircost")));
		if(cdao.insert(car)>0) { 
			msg = "추가성공";
			opener = true;
			closer = true;
		} else {
			url = "insertrepairForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	public ActionForward insertfuel(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String msg = "추가실패";
		String url = "fuelForm.do?repairtype=2";
		boolean opener = false;
		boolean closer = false;
		Car car = new Car();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String repairdate = request.getParameter("repairdate");
		try {
			car.setRepairdate(sdf.parse(repairdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		car.setId(id);
		car.setCartype(cartype);
		car.setFuelprice(Integer.parseInt(request.getParameter("fuelprice")));
		car.setFuel(Integer.parseInt(request.getParameter("fuel")));
		if(cdao.insert2(car)>0) { 
			msg = "추가성공";
			opener = true;
			closer = true;
		} else {
			url = "insertfuelForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	public ActionForward insertinsurance(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String msg = "추가실패";
		String url = "insuranceForm.do?repairtype=3";
		boolean opener = false;
		boolean closer = false;
		Car car = new Car();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String insurancedate = request.getParameter("insurancedate");
		try {
			car.setInsurancedate(sdf.parse(insurancedate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		car.setId(id);
		car.setCartype(cartype);
		car.setInsurancecost(Integer.parseInt(request.getParameter("insurancecost")));
		if(cdao.insert3(car)>0) { 
			msg = "추가성공";
			opener = true;
			closer = true;
		} else {
			url = "insertinsuranceForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	public ActionForward insertothers(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String msg = "추가실패";
		String url = "othersForm.do?repairtype=4";
		boolean opener = false;
		boolean closer = false;
		Car car = new Car();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String repairdate = request.getParameter("repairdate");
		try {
			car.setRepairdate(sdf.parse(repairdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		car.setId(id);
		car.setCartype(cartype);
		car.setRepairname(request.getParameter("repairname"));
		car.setRepaircost(Integer.parseInt(request.getParameter("repaircost")));
		if(cdao.insert4(car)>0) { 
			msg = "추가성공";
			opener = true;
			closer = true;
		} else {
			url = "insertothersForm.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	public ActionForward insertrepairname(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		String msg = "정비항목 추가 실패";
		String url = "repairForm.do?repairtype=1";
		String chgname = request.getParameter("chgname");
		int chgdate = Integer.parseInt(request.getParameter("chgdate"));
		int repairno = cdao.getno();
		if(cdao.insert5(repairno+1, chgname, chgdate) > 0) {
			msg = "정비항목 추가 성공";
			opener = true;
			closer = true;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	public ActionForward costchartForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String year = (String)request.getParameter("year");
		List<Map<String,Integer>> list = cdao.cost(id, cartype, year);
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward monthgraph(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String year = (String)request.getParameter("year");
		if(year == null || year.trim().equals("")) {
			Calendar now = Calendar.getInstance();
			year = Integer.toString(now.get(Calendar.YEAR));
		}
		List<Map<String,Integer>> list = cdao.monthgraph(id, cartype, year);
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward yeargraph(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		List<Map<String,Integer>> list = cdao.yeargraph(id, cartype);
		request.setAttribute("list", list);
		return new ActionForward();
	}
	
	public ActionForward eachgraph(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		String cartype = (String)request.getSession().getAttribute("cartype");
		String year = request.getParameter("year");
		if(year == null || year.trim().equals("")) {
			Calendar now = Calendar.getInstance();
			year = Integer.toString(now.get(Calendar.YEAR));
		}
		String repairtype = request.getParameter("repairtype");
		if(repairtype == null || repairtype.trim().equals("")) {
			repairtype = "1";
		}
		List<Map<String,Integer>> list = cdao.eachgraph(id, cartype, year, repairtype);
		request.setAttribute("list", list);
		return new ActionForward();
	}
}