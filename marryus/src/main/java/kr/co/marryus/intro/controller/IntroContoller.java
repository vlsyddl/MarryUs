package kr.co.marryus.intro.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marryus.intro.service.IntroService;
import kr.co.marryus.repository.domain.Connection;

@Controller("kr.co.marryus.intro.controller.IntroContoller")
@RequestMapping("/intro")
public class IntroContoller {
	
	@Autowired
	private IntroService service;
	
	@RequestMapping("/intro.do")
	public void intro(HttpServletRequest request) {
		System.out.println("접속자 IP : "+request.getRemoteAddr());
		System.out.println("접속자 브라우져 : "+request.getHeader("User-Agent"));
		System.out.println("접속자 접속경로 : "+request.getHeader("referer"));
		System.out.println("실행");
		Connection connection = new Connection();
		connection.setConnectionIp(request.getRemoteAddr());
		connection.setConnectionAgent(request.getHeader("User-Agent"));
		connection.setConnectionRefer(request.getHeader("referer"));
		service.checkConnection(connection);
	}
}
