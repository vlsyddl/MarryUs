package kr.co.marryus.connection.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.co.marryus.connection.service.ConnectionService;
import kr.co.marryus.repository.domain.Connection;

@Controller
@RequestMapping("/connection")
public class ConnectionController implements HttpSessionListener{
	
	@Autowired
	private ConnectionService service;
	
	@Override
	@RequestMapping("/connection.do")
    public void sessionCreated(HttpSessionEvent arg0){
        HttpSession session = arg0.getSession();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        ConnectionController connContoller = (ConnectionController)wac.getBean("connContoller");
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        Connection connection = new Connection();
        connection.setConnectionIp(req.getRemoteAddr());
        connection.setConnectionAgent(req.getHeader("User-Agent"));//브라우저 정보
        connection.setConnectionRefer(req.getHeader("referer"));//접속 전 사이트 정보
        service.checkConnection(connection);
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
        //TODO Auto-generated method stub
    }
}
