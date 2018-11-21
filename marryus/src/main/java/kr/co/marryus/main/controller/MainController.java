package kr.co.marryus.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.main.controller.MainContoller")
@RequestMapping("/main")
public class MainController {
	@RequestMapping("/main.do")
	public void loginMain() {}
}
