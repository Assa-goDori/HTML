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
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "../../main.do");
			return false;
		}
		if (id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "���� �ŷ��� �����մϴ�.");
			request.setAttribute("url", "../main/mainForm.do");
			return false;
		}
		if (id == null || id.trim().equals(""))
			id = login;
		return true;
	}

	public ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		String msg = "���̵� Ȯ���ϼ���.";
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
				msg = mem.getName() + "���� �α��� �߽��ϴ�.";
				url = "../main/mainForm.do";
				closer = true;
				opener = true;
			} else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
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
		String msg = "ȸ������ ����";
		String url = "joinForm.do";
		if (dao.insert(mem) > 0) {
			closer = true;
			msg = mem.getName() + "�� ȸ�� ���� �Ϸ�";
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

			String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			String url = "updateForm.do?id=" + mem.getId();
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(mem.getId());
			if (login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
				int result = dao.update(mem);
				if (result > 0) { // ���� ����
					String pic = new MemberDao().selectPic(id);
					request.getSession().setAttribute("pic", pic);
					return new ActionForward(true, "info.do?id=" + mem.getId());
				} else {
					msg = "��������";
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
		String msg = "�����������";
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
					msg = "�������漺��";
					url = "info.do?id=" + id;
				} else {
					msg = "��������� �����߻�";
				}
			} else {
				mem.setId(id);
				mem.setBrand2(request.getParameter("brand2"));
				mem.setCarname2(request.getParameter("carname2"));
				if (dao.updatecar(mem) > 0 && cdao.delete(id, cartype) >= 0) {
					opener = true;
					closer = true;
					msg = "�������漺��";
					url = "info.do?id=" + id;
				} else {
					msg = "��������� �����߻�";
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
		String msg = "��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
		String url = "passwordForm.do";
		if (login == null || login.trim().equals("")) {
			opener = true;
			closer = true;
			msg = "�α��� �ϼ���.";
			url = "loginForm.do";
		} else { // �α��� ����
			String pass = request.getParameter("pass");
			String chgpass = request.getParameter("chgpass");
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			if (pass.equals(mem.getPass())) {// �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ���
				closer = true;
				if (dao.updatePass(login, chgpass) > 0) {
					opener = true;
					msg = "��й�ȣ�� ����Ǿ����ϴ�.";
					url = "info.do?id=" + login;
				} else {
					msg = "��й�ȣ ����� ������ �߻� �߽��ϴ�.";
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
		// �α��� üũ
		String msg = null;
		String url = null;
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");			
			if (id.equals("admin")) { // Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
				msg = "�����ڴ� Ż���� �� �����ϴ�.";
				url = "list.do";
			} else {
				MemberDao dao = new MemberDao();
				BoardDao bdao = new BoardDao();
				Member dbmem = dao.selectOne(id); // db ���� ��ȸ
				if (login.equals("admin") || pass.equals(dbmem.getPass())) {
					if (bdao.deleteAllComment(id,0)>=0 && bdao.deleteall(id) >=0 && cdao.delete(id, 0) >=0 && dao.delete(id) > 0) { // ���� ����
						if (login.equals("admin")) { // �������� ���
							msg = id + " ����ڸ� ���� Ż�� ����";
							url = "list.do";
						} else { // �Ϲݻ������ ���
							msg = id + "����  ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
							url = "../../main.do";
							request.getSession().invalidate(); // �α׾ƿ�
						}
					} else { // ���� ����
						msg = id + "���� Ż��� ���� �߻�.";
						if (login.equals("admin")) { // �������� ���
							url = "list.do";
						} else { // �Ϲݻ������ ���
							url = "info.do?id=" + id;
						}
					}
				} else { // �Ϲݻ������ ��й�ȣ�� Ʋ�����
					msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
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
		String msg = "������������";
		String url = "updateForm.do?id=" + id;
		if (!logincheck(request)) {
			return new ActionForward(false, "../alert.jsp");
		} else {
			if (dao.deletecar(id, cartype) > 0 && cdao.delete(id, Integer.parseInt(cartype)) >= 0) {
				opener = true;
				msg = "������������";
				url = "info.do?id=" + id;
				closer = true;
			} else {
				msg = "���������� �����߻�";
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
			request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
			request.setAttribute("url", "loginForm.do");
			return new ActionForward(false, "../alert.jsp");
		}
		if (!login.equals("admin")) {
			request.setAttribute("msg", "�����ڸ� ������ �ŷ��Դϴ�.");
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
		String msg = "������ �´� id�� ã�� �� �����ϴ�.";
		String url = "idForm.do";
		if (id != null) { // id ã�� ���
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
			request.setAttribute("msg", "������ ���� �ʽ��ϴ�");
			request.setAttribute("url", "../../main.do");
			request.setAttribute("opener", true);
			request.setAttribute("closer", true);
			return new ActionForward(false, "../alerturl.jsp");
		}
		try {
			String sendid = "celestyn_05@naver.com";
			String sendpw = "gksdideo1!";
			String recipient = email;
			String title = "CarKeeping Book �ӽú�й�ȣ ����";
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
			mail.setRecipients(Message.RecipientType.TO, address);		//�����ڵ鼳��(��������), Message.RecipientType.TO : �޴� ����(TO:�޴»��, CC:������)
			mail.setSubject(title);
			mail.setSentDate(new Date());
			mail.setText(contents);
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(contents,mtype);							//���� ����, ���� ���� ����
			multipart.addBodyPart(body);
			mail.setContent(multipart);									//����(÷�����Ͽ� ���� ���뵵 ���� �� ���� : multipart)
			Transport.send(mail);
			opener = true;
			closer = true;
			
			if(dao.updatePass(id, contents) > 0 ) {
				request.setAttribute("msg", "�ӽú�й�ȣ ���� �Ϸ�");
				request.setAttribute("url", "../../main.do");
				request.setAttribute("opener", opener);
				request.setAttribute("closer", closer);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "���� ���� �� ���� �߻�.");
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
		String msg = "��޻�½���";
		String url = "list.do";
		if (dao.up(id) > 0) {
			msg = "��޻�¼���";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");

	}

	public ActionForward down(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String msg = "����϶�����";
		String url = "list.do";
		if (dao.down(id) > 0) {
			msg = "����϶�����";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward sendupdown(HttpServletRequest request, HttpServletResponse response) {
		login = (String) request.getSession().getAttribute("login");
		String msg = "�����û����";
		String url = "info.do?id=" + login;
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		if (dao.sendupdown(login) > 0) {
			msg = "�����û�Ϸ�";
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
			request.setAttribute("msg", "��� ������ �����ϴ�. ������ ����ϼ���.");
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
			String msg = "���ü���";
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