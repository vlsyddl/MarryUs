package kr.co.marryus.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class WebsocketController {
	@GetMapping("/websocket/websocket.do")
	   public void test01() {}
}
