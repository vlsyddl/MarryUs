package kr.co.marryus.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.mypage.controller.MypageController")
@RequestMapping("/mypage")
public class MypageController {

	@RequestMapping("/mywedding.do")
	public void mywedding() {}
}
