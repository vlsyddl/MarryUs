package kr.co.marryus.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.community.controller.CommunityController")
@RequestMapping("/community")
public class CommunityController {
	@RequestMapping("/notice.do")
	public void weddingHall() {}
}
