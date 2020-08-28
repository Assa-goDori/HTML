package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.BoardDao;
import model.CarDao;
import model.Member;
import model.MemberDao;

public class MemberAllAction {
	private MemberDao dao = new MemberDao();
	private CarDao cdao = new CarDao();
	protected String id;
	protected String login;

	private boolean logincheck(HttpServletRequest request) {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if (login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "../../main.do");
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

	public ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		String msg = "아이디를 확인하세요.";
		String url = "loginForm.do";
		boolean opener = false;
		boolean closer = false;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		if (mem != null) {
			if (pass.equals(mem.getPass())) {
				int rating = new MemberDao().selectRating(id);
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("rating", rating);
				msg = mem.getName() + "님이 로그인 했습니다.";
				url = "../main/mainForm.do";
				closer = true;
				opener = true;
			} else {
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward(false, "../alerturl.jsp");
	}

	public ActionForward join(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		mem.setBrand1(request.getParameter("brand1"));
		mem.setCarname1(request.getParameter("carname1"));
		mem.setBrand2(request.getParameter("brand2"));
		mem.setCarname2(request.getParameter("carname2"));
		boolean opener = false;
		boolean closer = false;
		String msg = "회원가입 실패";
		String url = "joinForm.do";
		if (dao.insert(mem) > 0) {
			closer = true;
			msg = mem.getName() + "님 회원 가입 완료";
			url = "../../main.do";
			opener = true;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward(false, "../alerturl.jsp");
	}

	public ActionForward check(HttpServletRequest request, HttpServletResponse response) {
		String msg = "used";
		id = request.getParameter("id");
		Member m = dao.check(id);
		if (m == null) {
			msg = "can use";
		}
		request.setAttribute("msg", msg);
		return new ActionForward();
	}

	public ActionForward main(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			return new ActionForward();
		}
	}

	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return new ActionForward(true, "../../main.do");
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			Member mem = new MemberDao().selectOne(id);
			request.setAttribute("mem", mem);
			return new ActionForward();
		}
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			Member mem = new Member();
			mem.setId(request.getParameter("id"));
			mem.setPass(request.getParameter("pass"));
			mem.setName(request.getParameter("name"));
			mem.setTel(request.getParameter("tel"));
			mem.setEmail(request.getParameter("email"));
			mem.setPicture(request.getParameter("picture"));

			String msg = "비밀번호가 틀렸습니다.";
			String url = "updateForm.do?id=" + mem.getId();
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(mem.getId());
			if (login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
				int result = dao.update(mem);
				if (result > 0) { // 수정 성공
					String pic = new MemberDao().selectPic(id);
					request.getSession().setAttribute("pic", pic);
					return new ActionForward(true, "info.do?id=" + mem.getId());
				} else {
					msg = "수정실패";
				}
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	}

	public ActionForward updatecar(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		String msg = "차량변경실패";
		String url = "updatecarForm.do";
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			String id = (String) request.getSession().getAttribute("login");
			int cartype = Integer.parseInt(request.getParameter("cartype"));
			Member mem = new Member();
			if (cartype == 1) {
				mem.setId(id);
				mem.setBrand1(request.getParameter("brand1"));
				mem.setCarname1(request.getParameter("carname1"));
				if (dao.updatecar(mem) > 0 && cdao.delete(id, cartype) >= 0) {
					opener = true;
					closer = true;
					msg = "차량변경성공";
					url = "info.do?id=" + id;
				} else {
					msg = "차량변경시 오류발생";
				}
			} else {
				mem.setId(id);
				mem.setBrand2(request.getParameter("brand2"));
				mem.setCarname2(request.getParameter("carname2"));
				if (dao.updatecar(mem) > 0 && cdao.delete(id, cartype) >= 0) {
					opener = true;
					closer = true;
					msg = "차량변경성공";
					url = "info.do?id=" + id;
				} else {
					msg = "차량변경시 오류발생";
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward(false, "../alerturl.jsp");
	}

	public ActionForward password(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		boolean opener = false;
		boolean closer = false;
		String msg = "비밀번호 오류 입니다. 확인하세요.";
		String url = "passwordForm.do";
		if (login == null || login.trim().equals("")) {
			opener = true;
			closer = true;
			msg = "로그인 하세요.";
			url = "loginForm.do";
		} else { // 로그인 상태
			String pass = request.getParameter("pass");
			String chgpass = request.getParameter("chgpass");
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			if (pass.equals(mem.getPass())) {// 입력된 비밀번호와 db에 저장된 비밀번호가 같은 경우
				closer = true;
				if (dao.updatePass(login, chgpass) > 0) {
					opener = true;
					msg = "비밀번호가 변경되었습니다.";
					url = "info.do?id=" + login;
				} else {
					msg = "비밀번호 변경시 오류가 발생 했습니다.";
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward(false, "../alerturl.jsp");
	}

	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "model2/member/picture/";
		String fname = null;
		try {
			File f = new File(path);
			if (!f.exists()) {
				f.mkdirs();
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture");
			BufferedImage bi = ImageIO.read(new File(path + fname));
			int width = bi.getWidth() / 3;
			int height = bi.getHeight() / 3;
			BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumb.createGraphics();
			g.drawImage(bi, 0, 0, width, height, null);
			f = new File(path + "sm_" + fname);
			ImageIO.write(thumb, "jpg", f);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 체크
		String msg = null;
		String url = null;
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");			
			if (id.equals("admin")) { // 탈퇴 대상이 되는 회원은 관리자 안됨
				msg = "관리자는 탈퇴할 수 없습니다.";
				url = "list.do";
			} else {
				MemberDao dao = new MemberDao();
				BoardDao bdao = new BoardDao();
				Member dbmem = dao.selectOne(id); // db 정보 조회
				if (login.equals("admin") || pass.equals(dbmem.getPass())) {
					if (bdao.deleteAllComment(id,0)>=0 && bdao.deleteall(id) >=0 && cdao.delete(id, 0) >=0 && dao.delete(id) > 0) { // 삭제 성공
						if (login.equals("admin")) { // 관리자인 경우
							msg = id + " 사용자를 강제 탈퇴 성공";
							url = "list.do";
						} else { // 일반사용자인 경우
							msg = id + "님의  회원 탈퇴가 완료되었습니다.";
							url = "../../main.do";
							request.getSession().invalidate(); // 로그아웃
						}
					} else { // 삭제 실패
						msg = id + "님의 탈퇴시 오류 발생.";
						if (login.equals("admin")) { // 관리자인 경우
							url = "list.do";
						} else { // 일반사용자인 경우
							url = "info.do?id=" + id;
						}
					}
				} else { // 일반사용자의 비밀번호가 틀린경우
					msg = id + "님의 비밀번호가 틀립니다.";
					url = "deleteForm.do?id=" + id;
				}
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
}

	public ActionForward deletecar(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		String id = (String) request.getSession().getAttribute("login");
		String cartype = request.getParameter("cartype");
		String msg = "차량삭제실패";
		String url = "updateForm.do?id=" + id;
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			if (dao.deletecar(id, cartype) > 0 && cdao.delete(id, Integer.parseInt(cartype)) >= 0) {
				opener = true;
				msg = "차량삭제성공";
				url = "info.do?id=" + id;
				closer = true;
			} else {
				msg = "차량삭제시 오류발생";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward(false, "../alerturl.jsp");
	}

	public ActionForward deleteform(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			return new ActionForward();
		}
	}

	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "loginForm.do");
			return new ActionForward(false, "../alert.jsp");
		}
		if (!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능한 거래입니다.");
			request.setAttribute("url", "main.do");
			return new ActionForward(false, "../alert.jsp");
		}
		request.setAttribute("list", new MemberDao().list());
		return new ActionForward();
	}

	public ActionForward id(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		dao = new MemberDao();
		String id = dao.idSearch(email, tel);
		String msg = "정보에 맞는 id를 찾을 수 없습니다.";
		String url = "idForm.do";
		if (id != null) { // id 찾은 경우
			request.setAttribute("id", id);
		} else {
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward();
	}

	public ActionForward pw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		boolean opener = false;
		boolean closer = false;
		String pass = dao.pwSearch(id, email);
		if(pass == null) {
			request.setAttribute("msg", "정보가 맞지 않습니다");
			request.setAttribute("url", "../../main.do");
			request.setAttribute("opener", true);
			request.setAttribute("closer", true);
			return new ActionForward(false, "../alerturl.jsp");
		}
		try {
			String sendid = "celestyn_05@naver.com";
			String sendpw = "gksdideo1!";
			String recipient = email;
			String title = "CarKeeping Book 임시비밀번호 전송";
			String mtype = "text/plain; charset=EUC-KR";
			int newpass = (int)(Math.random()*9000+1000);
			String contents = Integer.toString(newpass);
			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.naver.com");
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");								
			prop.put("mail.debug", "false");
			prop.put("mail.smtp.user", sendid);								
			prop.put("mail.smtp.socketFactory.port", "465");
			prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			prop.put("mail.smtp.socketFactory.fallback", "false");
			MyAuthenticator auth = new MyAuthenticator(sendid, sendpw);
			Session session = Session.getInstance(prop,auth); 
			MimeMessage mail = new MimeMessage(session);
			mail.setFrom(new InternetAddress(sendid));
			InternetAddress[] address = { new InternetAddress(recipient) };
			mail.setRecipients(Message.RecipientType.TO, address);		//수신자들설정(다중전송), Message.RecipientType.TO : 받는 메일(TO:받는사람, CC:참조인)
			mail.setSubject(title);
			mail.setSentDate(new Date());
			mail.setText(contents);
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(contents,mtype);							//메일 내용, 문서 형식 설정
			multipart.addBodyPart(body);
			mail.setContent(multipart);									//내용(첨부파일에 대한 내용도 보낼 수 있음 : multipart)
			Transport.send(mail);
			opener = true;
			closer = true;
			
			if(dao.updatePass(id, contents) > 0 ) {
				request.setAttribute("msg", "임시비밀번호 전송 완료");
				request.setAttribute("url", "../../main.do");
				request.setAttribute("opener", opener);
				request.setAttribute("closer", closer);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "메일 전송 중 오류 발생.");
		}
		return new ActionForward(false, "../alerturl.jsp");
	}
	
	private final class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}

	public ActionForward up(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String msg = "등급상승실패";
		String url = "list.do";
		if (dao.up(id) > 0) {
			msg = "등급상승성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");

	}

	public ActionForward down(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String msg = "등급하락실패";
		String url = "list.do";
		if (dao.down(id) > 0) {
			msg = "등급하락성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward sendupdown(HttpServletRequest request, HttpServletResponse response) {
		login = (String) request.getSession().getAttribute("login");
		String msg = "등업신청실패";
		String url = "info.do?id=" + login;
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		if (dao.sendupdown(login) > 0) {
			msg = "등업신청완료";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward selectcarForm(HttpServletRequest request, HttpServletResponse response) {
		id = (String) request.getSession().getAttribute("login");
		Member m = dao.selectcheck(id);
		if(m == null) {
			boolean opener = true;
			boolean closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", "등록 차량이 없습니다. 차량을 등록하세요.");
			request.setAttribute("url", "../main/mainForm.do");
			return new ActionForward(false, "../alerturl.jsp");
		}
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}

	public ActionForward selectcar(HttpServletRequest request, HttpServletResponse response) {
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			boolean opener = false;
			boolean closer = false;
			String msg = "선택성공";
			String url = "../car/repairmain.do";
			String inputcartype = request.getParameter("cartype");
			opener = true;
			closer = true;
			request.setAttribute("opener", opener);
			request.setAttribute("closer", closer);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			request.getSession().setAttribute("cartype", inputcartype);
			return new ActionForward(false, "../alerturl.jsp");
		}
	}
}