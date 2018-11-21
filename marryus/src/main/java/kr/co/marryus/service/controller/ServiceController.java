package kr.co.marryus.service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.service.controller.ServiceContoller")
@RequestMapping("/service")
public class ServiceController {
	@RequestMapping("/weddingHall.do")
	public void weddingHall() {}
}
