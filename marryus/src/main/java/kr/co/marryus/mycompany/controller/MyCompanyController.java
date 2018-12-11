package kr.co.marryus.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.mycompany.controller.MyCompanyController")
@RequestMapping("/mycompany")
public class MyCompanyController {

	@RequestMapping("/mycompany.do")
	public void mycompany() {}
}
