package kr.co.marryus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.controller.IntroContoller")
@RequestMapping("/intro")
public class IntroContoller {
	@RequestMapping("/intro.do")
	public void loginMain() {}
}
