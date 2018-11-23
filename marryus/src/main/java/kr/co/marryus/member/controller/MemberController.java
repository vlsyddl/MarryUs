package kr.co.marryus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.mapper.MemberMapper;

@Controller("kr.co.marryus.member.controller.MemberController")
@RequestMapping("/main")
public class MemberController {
	@Autowired
	private MemberMapper mapper;

	/**로그인 
	 * 
	 */
	@RequestMapping("/login.do")
	public String login(Member member , HttpSession session) throws Exception {
		
		Member mem=mapper.login(member);
		
		System.out.println("로그인 되었습니다.");
		System.out.println("아이디:" + mem.getEmail());
		System.out.println("비밀번호:" + mem.getPass());
		System.out.println("회원타입:" + mem.getType());
		String type=mem.getType();

		
		session.setAttribute("user", mem);
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
