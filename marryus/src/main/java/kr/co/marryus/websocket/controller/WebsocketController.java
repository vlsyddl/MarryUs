package kr.co.marryus.websocket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.marryus.repository.domain.Member;
@Controller
public class WebsocketController {
	@GetMapping("/websocket/websocket.do")
	public void websocket() {

	}
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
}
