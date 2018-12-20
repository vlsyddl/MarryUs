package kr.co.marryus.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.MessageVO;

@Component("websocket")
public class MainSocketHandler extends TextWebSocketHandler{
	private org.slf4j.Logger logger = LoggerFactory.getLogger(MainSocketHandler.class);
	
	
	/**
     * 서버에 연결한 사용자들을 저장하는 리스트
     */
    private List<WebSocketSession> connectedUsers;
    private HashMap<String,WebSocketSession> connectedUser;
    private String user;
    
	public MainSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		connectedUser = new HashMap<String,WebSocketSession>();
		System.out.println("웹소켓 객체 생성");
	}
	

	 /**
     * 접속과 관련된 Event Method
     *
     * @param WebSocketSession
     *            접속한 사용자
     */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String userId;
		Map<String,Object> map = session.getAttributes();
		System.out.println("map : "+map);
		
		if(map.get("user")!=null) {
			Member member = (Member)map.get("user");
			userId = member.getEmail();
			System.out.println("member : "+member);
		}else {
			Admin admin = (Admin) map.get("admin");
			userId = admin.getAdmId();
			System.out.println("admin : "+admin);
		}
		
		System.out.println("로그인 한 이름 : " + userId);
		debug(session.getId() + " 연결 됨!!");		
		connectedUser.put(userId, session);
		System.out.println("접속한 회원 : "+connectedUser.toString());
        //logger.info(session.getId() + "님이 접속했습니다.");
        //logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		
		/* 
        for (WebSocketSession webSocketSession : connectedUsers) {
            
             * 자신이 보낸 메시지를 받지 않는다.
             
            if (!session.getId().equals(webSocketSession.getId())) {
                webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "퇴장했습니다."));
            }
        }
 */
        logger.info(session.getId() + "님이 퇴장했습니다.");
        debug("이유 : "+status.toString());
		debug(session.getId() + " 연결 종료됨");
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        MessageVO messageVO = MessageVO.converMessage(message.getPayload());
        String hostName = "";
        System.out.println("보낸사람 : "+messageVO.getFrom());
        System.out.println("내용 : "+messageVO.getMessage());
        System.out.println("메세지 타입 : "+messageVO.getType());
        System.out.println("받는사람 : "+messageVO.getTo());
        if(messageVO.getType().equals("message")) {        	
        	if(messageVO.getTo().equals("admin")) {
        		if(connectedUser.get("admin")!=null) {
        			connectedUser.get("admin").sendMessage(new TextMessage(messageVO.getFrom()+":"+messageVO.getMessage()));
        		}else {
        			connectedUser.get(messageVO.getFrom()).sendMessage(new TextMessage("admin:관리자가 자리를 비웠습니다 전화 혹은 이메일을 보내주세요"));
        		}
        	}else {
        		if(connectedUser.get(messageVO.getTo())!=null) {
        			connectedUser.get(messageVO.getTo()).sendMessage(new TextMessage(messageVO.getFrom()+":"+messageVO.getMessage()));
        		}else {
        			connectedUser.get(messageVO.getFrom()).sendMessage(new TextMessage("사용자:사용자가 자리를 비웠습니다 전화 혹은 이메일을 보내주세요"));
        		}
        	}
        }
        debug(session.getId() + "님의 메시지 : " + message.getPayload());
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}
	
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private void debug(String msg) {
		System.out.printf("Websocket(%s) : %s\n", time.format(new Date()), msg);
	}

}


