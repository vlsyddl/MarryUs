package kr.co.marryus.service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marryus.wedservice.service.HoneymoonService;

@Controller("kr.co.marryus.service.controller.HoneymoonController")
@RequestMapping("/service")
public class HoneymoonController {
	
	@Autowired
	private HoneymoonService service;
	
	
}
