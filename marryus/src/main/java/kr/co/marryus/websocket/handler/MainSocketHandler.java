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

import kr.co.marryus.test.controller.Member;

@Component("websocket")
public class MainSocketHandler extends TextWebSocketHandler{
	private Map<String, WebSocketSession> users = new HashMap<>();	
	public MainSocketHandler() {
		System.out.println("웹소켓 객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		debug(session.getId() + " 연결 됨!!");
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		debug(session.getId() + " 연결 종료됨");
		Map<String, Object> attrs = session.getAttributes();
		System.out.println(users);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession wss, TextMessage message) throws Exception {
		debug("보낸 아이디 - " + wss.getId());
		debug("보낸 메세지 - " + message.getPayload());
		String sendMsg = "";
		String rcvAll = message.getPayload();
		System.out.println("rcvAll : "+rcvAll);
		String[] rcvSplit = rcvAll.split("/");		
		
		String msgType= rcvSplit[0];
		System.out.println("msgType : "+msgType);
		String msgId= rcvSplit[1];
		System.out.println("msgId : "+msgId);
		String msgMessage= rcvSplit[2];
		System.out.println("msgMessage : "+msgMessage);
		
		System.out.println(rcvAll);
		System.out.println(users);
		if(msgType.equals("start")) {
			users.put(msgId,wss);
		}else{
			if(msgId.startsWith("admin-")) {
				users.get(msgId.split("-")[1]).sendMessage(new TextMessage(msgMessage));
			}else{
				if(users.get("admin") == null) {
					System.out.println(users.get("admin"));
					System.out.println(users.get(msgId.split("-")[0]));
					users.get(msgId.split("-")[0]).sendMessage(new TextMessage("관리자가 자리를 비웠습니다"));
					
				}else{
					System.out.println("messaId : "+msgId.split("-")[0]);
					System.out.println("message : "+msgMessage);
					users.get("admin");
					users.get("admin").sendMessage(new TextMessage(msgId.split("-")[0]+":"+msgMessage));
				}
			}
		}
		
		/*if(rcvMsg.startsWith("start|")) {
			id = rcvMsg.substring("start|".length());
			users.put(id,wss);
			System.out.println(users);
			sendMsg = id+"연결";
		}else if(rcvMsg.startsWith("user:")) {
			id = rcvMsg.substring("user:".length());
			users.put(id, wss);
			System.out.println(users);
			sendMsg = id+"연결";
		}else {
			System.out.println("rcvMsg : "+rcvMsg);
			String[] arr = rcvMsg.split(":");
			String[] toFrom = arr[0].split("-");
			System.out.println(toFrom[0]);
			if(toFrom[0].equals("admin")) {
				sendMsg = toFrom[1] + " : " + arr[1];
				System.out.println(sendMsg);
				users.get("TestUser").sendMessage(new TextMessage(sendMsg));
			}else if(toFrom[0].equals("user")) {
				sendMsg = toFrom[1] + " : " +arr[1];
				System.out.println(sendMsg);
				if(users.get("TestAdmin") !=null) {
					users.get("TestAdmin").sendMessage(new TextMessage(sendMsg));
				}else {
				
				}
			}*/
		//}
		
		/*System.out.println("sendMsg : " + sendMsg);
		System.out.println("users : " + users);
		*/
		/*Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wSession = users.get(key);
			wSession.sendMessage(new TextMessage(sendMsg));
		}*/
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}
	
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private void debug(String msg) {
		System.out.printf("Test01SocketHandler(%s) : %s\n", time.format(new Date()), msg);
	}

}


