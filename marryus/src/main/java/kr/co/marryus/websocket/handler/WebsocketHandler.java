package kr.co.marryus.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.marryus.repository.domain.Member;


@Component("websocket")
public class WebsocketHandler extends TextWebSocketHandler{
private Map<String, WebSocketSession> users = new HashMap<>();
	
	public void TextWebSocketHandler() {
		System.out.println("Test03SocketHandler 객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		debug(session.getId() + "연결");
	}

	@Override
	public void afterConnectionClosed(
		WebSocketSession session, CloseStatus status) throws Exception {
		
		debug(session.getId() + " 연결 종료됨");
		Map<String, Object> attrs = session.getAttributes();
		Member m = (Member)attrs.get("user");
		users.remove(m.getEmail());
		System.out.println(users);
		
	}
	
	@Override
	public void handleTextMessage(WebSocketSession wss, TextMessage message) throws Exception {
		debug("보낸 아이디 - " + wss.getId());
		debug("보낸 메세지 - " + message.getPayload());
		
		String rcvMsg = message.getPayload();
		String sendMsg = "";
		if (rcvMsg.startsWith("login:")) {
			String id = rcvMsg.substring("login:".length());
			users.put(id, wss);
			sendMsg = id + "님이 로그인하였습니다.";
		}
		else if (rcvMsg.startsWith("logout:")) {
			String id = rcvMsg.substring("logout:".length());
			users.remove(id);
			sendMsg = id + "님이 로그아웃하였습니다.";
		}
		else {
			String[] arr = rcvMsg.split(":");
			sendMsg = arr[0] + " : " + arr[1];
		}
		
		System.out.println("sendMsg : " + sendMsg);
		System.out.println("users : " + users);

		Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wSession = users.get(key);
			wSession.sendMessage(new TextMessage(sendMsg));
		}
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}
	
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private void debug(String msg) {
		System.out.printf(this.getClass().getSimpleName() + "(%s) : %s\n", time.format(new Date()), msg);
	}
}
