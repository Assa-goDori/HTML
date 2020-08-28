package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import model.ChatDao;

@ServerEndpoint("/chatting") //웹소켓의 서버클래스 지정
public class ChatController {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private ChatDao dao = new ChatDao();
	@OnMessage	//client에서 메세지 수신
	public void onMessage(String message, Session session) throws IOException {
		//session : 메세지를 전송한 객체
		//message : 클라이언트가 전송한 메세지		"(로그인아이디 : 메세지 내용)"
		synchronized(clients) {	//스레드 동기화
			dao.insert(message);
			for(Session client : clients) {	//broadcast : 모든클라이언트에게 메세지 전송
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);	//클라이언트로 메세지 전송
				}
			}
		}
	}
	
	@OnOpen	//client가 연결되었을 때
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}