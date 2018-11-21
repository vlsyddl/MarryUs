package kr.co.marryus.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.intro.controller.IntroContoller")
@RequestMapping("/intro")
public class IntroContoller {
	@RequestMapping("/intro.do")
	public void intro() {}
}
