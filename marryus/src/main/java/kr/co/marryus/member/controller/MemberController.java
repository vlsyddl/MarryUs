package kr.co.marryus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marryus.member.service.MemberServiceImpl;
import kr.co.marryus.repository.domain.Member;

/**
 * 로그인  controller
 * @author suzie
 *
 */
@Controller("kr.co.marryus.member.controller.MemberController")
@RequestMapping("/main")
public class MemberController {
	/**
	 *  MemberMapper 멤버 필드
	 */
//	@Autowired
//	private MemberMapper mapper;
	@Autowired
	private MemberServiceImpl service;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/**로그인 
	 * 
	 */
	
	@RequestMapping("/login.do")
	public String login(Member member , HttpSession session) throws Exception {
		// 비밀번호 암호화
		String rawPassword = member.getPass();
		
		System.out.println("rawPassword||"+rawPassword);
		
		member=service.login(member);
		
		String encodedPassword = member.getPass();
		
		
		// 비밀번호 암호화
		if(passwordEncoder.matches(rawPassword, encodedPassword)) {
			System.out.println("로그인 되었습니다.");
			System.out.println("아이디:" + member.getEmail());
			System.out.println("비밀번호:" + member.getPass());
			System.out.println("회원타입:" + member.getType());
			String type=member.getType();
			String mg = "mg";
			
			if(type.equals(mg)) {
				System.out.println("일반");
				member = service.loginGeneral(member);
				
			}else {
				System.out.println("기업");
				member = service.loginCompany(member);
			}
			
			session.setAttribute("user", member);
		}else {
			
			System.out.println("계정정보 불일치");
		}
		

		return "redirect:main.do";
	}
	
	/**
	 * 로그아웃
	 * 
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		//invalidate();- 로그아웃하면서 세션정보를 파괴시킨다. 
		session.invalidate();
		return "redirect:main.do";
	}
		
	
}
