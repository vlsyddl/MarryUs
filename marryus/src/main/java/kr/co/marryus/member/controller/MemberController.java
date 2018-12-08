package kr.co.marryus.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Autowired
	private MemberServiceImpl service;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping("/findpassword.do")
	public void findpassword() {};
	
	
	/**로그인 
	 * 
	 */
	
	@RequestMapping("/login.json")
	@ResponseBody
	public Member login(Member member , HttpSession session) throws Exception {
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
			member = null;
			return member;
		}
		

		return member;
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
	
	/*@RequestMapping(value = "/matchEmailnName.json", method =RequestMethod.POST)
	@ResponseBody
	public int checkEmail(Member member){
		System.out.println("member::"+member.getEmail());
		service.findId(member);
		System.out.println("호잇!");
		return 0;
		
	}*/
	
	/**
	 * 이메일로 인증번호 보내기 
	 * @param session
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findPass.do")
	public String findPass(HttpSession session, Member member) throws Exception {
		
		// 비밀번호 찾기 인증 이메일 찾기 
		String keyCode = FindUtil.createKey();
		session.setAttribute("keyCode", keyCode);
		session.setAttribute("email", member.getEmail());
		String subject = "[Marry Us !] 비밀번호 찾기 인증코드 안내";
		String msg = "";
		msg += "<div align ='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color:blue;'>비밀번호 찾기 인증코드입니다.</h3>";
		msg += "<div style='font-size:130%'>";
		msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
		msg += keyCode+"</strong>를 입력해주세요 </div></br>";
		msg += "<a href='http://localhost:8000/marryus/main/findpassword.do'> 새 비밀번호 받기  </a>";
		MailUtil.sendEmail(member.getEmail(), subject, msg);
		
		return "redirect:main.do";
	}
	
	/**
	 * 인증코드 입력하기 
	 * @param inputCode
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findpassword.json", method= RequestMethod.POST)
	@ResponseBody
	public String findPassword( String inputCode, HttpSession session) throws Exception {
		String keyCode = (String)session.getAttribute("keyCode");
		
		// session에 담긴 코드와 사용자가 입력한 code의 value 확인 
		if(!inputCode.equals(keyCode)) {
			System.out.println("실패!");
			return "{\"result\":1}";
		};
		
		session.removeAttribute(keyCode);
		
		
		 return "{\"result\":0}";
	}
	
	/**
	 * 새로운 비밀번호로 업데이트 
	 * @param member
	 * @return
	 */
	@RequestMapping("/newPassword.do")
	public String updateNewPass(Member member) {
		String rawPassword = member.getPass();
		String endPassword = passwordEncoder.encode(rawPassword);
		member.setPass(endPassword);
		service.updateNewPass(member);
		return "redirect:main.do";
				
	}
	/**
	 * 비밀번호 찾기 
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/checkID.json")
	@ResponseBody
	public int checkID(Member member) throws Exception {
		/*
		 	서비스를 실행해서 아이디와 이름으로 검색 해서 결과값이 
		 	"0" 이면 아디이가 없다는거고 , "1"이면 존재한다는 이야기 
		 */
		int check = service.findId(member);
		return check;
	}
	
	/**
	 * 회원가입 아이디 중복체크
	 * @param email
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/checkEmail.json", method=RequestMethod.POST)
	public void getPersonMngUserIdCheck(String email, HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	  int selectUserIdCheck = service.checkID(email);

	  PrintWriter out = response.getWriter();
	  if (selectUserIdCheck == 0) {
		
	   out.println("true");

	  } else {
	   out.println("false");

	  };
	 
	
	 }
}
