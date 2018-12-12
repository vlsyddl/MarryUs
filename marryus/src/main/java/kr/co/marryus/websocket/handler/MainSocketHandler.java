package kr.co.marryus.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.marryus.repository.domain.MessageVO;

@Component("websocket")
public class MainSocketHandler extends TextWebSocketHandler{
	private org.slf4j.Logger logger = LoggerFactory.getLogger(MainSocketHandler.class);
	 
	/**
     * 서버에 연결한 사용자들을 저장하는 리스트
     */
    private List<WebSocketSession> connectedUsers;
    private HashMap<String,WebSocketSession> connectedUser;
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
		debug(session.getId() + " 연결 됨!!");
		connectedUsers.add(session);
		 
        logger.info(session.getId() + "님이 접속했습니다.");
        logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		connectedUsers.remove(session);
		 
        for (WebSocketSession webSocketSession : connectedUsers) {
            /*
             * 자신이 보낸 메시지를 받지 않는다.
             */
            if (!session.getId().equals(webSocketSession.getId())) {
                webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "퇴장했습니다."));
            }
        }
 
        logger.info(session.getId() + "님이 퇴장했습니다.");

		debug(session.getId() + " 연결 종료됨");
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        MessageVO messageVO = MessageVO.converMessage(message.getPayload());
        String hostName = "";
 
        for (WebSocketSession webSocketSession : connectedUsers) {
            if (messageVO.getType().equals("all")) {
                if (!session.getId().equals(webSocketSession.getId())) {
                    webSocketSession.sendMessage(
                            new TextMessage(session.getRemoteAddress().getHostName() + " ▶ " + messageVO.getMessage()));
                }
            } else {
                hostName = webSocketSession.getRemoteAddress().getHostName();
                if (messageVO.getTo().equals(hostName)) {
                    webSocketSession.sendMessage(
                            new TextMessage(
                                    "<span style='color:red; font-weight: bold;' >"
                                    + session.getRemoteAddress().getHostName() + "▶ " + messageVO.getMessage()
                                    + "</span>") );
                    break;
                }
            }
        }
 
        /*
         * Payload : 사용자가 보낸 메시지
         */
        logger.info(session.getId() + "님의 메시지 : " + message.getPayload());
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


