package kr.co.marryus.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestControeller {

	@GetMapping("/test/websocket.do")
	public void websocket() {}
	@GetMapping("/test/adminWebsocket.do")
	public void adminWebsocket() {}
	@GetMapping("/test/test2.do")
	public void testWebsocket() {}
	
	@PostMapping("/websocket/login.do")
	   @ResponseBody
	   public String login(HttpSession session, Member m) {
		   session.setAttribute("user", m);
		   return "success";
	   }

	   @GetMapping("/websocket/logout.do")
	   @ResponseBody
	   public String logout(HttpSession session) {
		   session.invalidate();
		   return "success";
	   }

	   @GetMapping("/websocket/websocket.do")
	   public String index() {
	      return "websocket/index";
	   }
	   
	   @GetMapping("/websocket/chat.do")
	   public String chat() {
		   return "websocket/chat/chat";
	   }
}
