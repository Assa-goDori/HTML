package mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailBean {
	private String sendid;		//송신자
	private String sendpw;		//송신자 인증 비밀번호
	private String recipient;	//수신자
	private String title;		//제목
	private String contents;	//내용
	private String mtype;		//문서형식타입
	private String err_msg;		//오류메세지
	
	public boolean sendMail() {
		//properties : map 구현 클래스
		//				Hashtable 클래스의 하위 클래스.
		//				(key:String, value:String) map 클래스
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");					//메일 전송 서버 설정 값
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.starttls.enable", "true");					//tls : 인증설정 부분. 반드시 true설정해야함
		prop.put("mail.smtp.auth", "true");								//인증 받은 메일만 가능
		prop.put("mail.debug", "false");								//debug(검증을 위한 개발모드) : debug사용시 프로그램 느려짐
		prop.put("mail.smtp.user", sendid);								//네이버 아이디
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		MyAuthenticator auth = new MyAuthenticator(sendid, sendpw);		//인증객체
		Session session = Session.getInstance(prop,auth);				//메일 전송을 위한 연결 객체
		MimeMessage msg = new MimeMessage(session);						//msg : 메일 전송을 위한 메일 객체
		try {
			msg.setFrom(new InternetAddress(sendid));					//송신자설정
			InternetAddress[] address = { new InternetAddress(recipient) };
			msg.setRecipients(Message.RecipientType.TO, address);		//수신자들설정(다중전송), Message.RecipientType.TO : 받는 메일(TO:받는사람, CC:참조인)
			msg.setSubject(title);
			msg.setSentDate(new Date());
			msg.setText(contents);
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(contents,mtype);							//메일 내용, 문서 형식 설정
			multipart.addBodyPart(body);
			msg.setContent(multipart);									//내용(첨부파일에 대한 내용도 보낼 수 있음 : multipart)
			Transport.send(msg);	//메일 전송
		} catch(MessagingException me) {
			System.out.println(me.getMessage());
			me.printStackTrace();
			return false;
		}
		return true;
	}
	
	public final class MyAuthenticator extends Authenticator {		//내부클래스로 인증객체 생성 설정(Authenticator 객체 상속 받아야 함)
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		protected PasswordAuthentication getPasswordAuthentication() {	//Authenticator의 추상메서드
			return new PasswordAuthentication(id, pw);
		}
	}

	public String getSendid() {
		return sendid;
	}

	public void setSendid(String sendid) {
		this.sendid = sendid;
	}

	public String getSendpw() {
		return sendpw;
	}

	public void setSendpw(String sendpw) {
		this.sendpw = sendpw;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getErr_msg() {
		return err_msg;
	}

	public void setErr_msg(String err_msg) {
		this.err_msg = err_msg;
	}

	@Override
	public String toString() {
		return "MailBean [sendid=" + sendid + ", sendpw=" + sendpw + ", recipient=" + recipient + ", title=" + title
				+ ", contents=" + contents + ", mtype=" + mtype + ", err_msg=" + err_msg + "]";
	}
}
