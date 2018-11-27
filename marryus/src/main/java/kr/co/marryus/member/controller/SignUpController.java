package kr.co.marryus.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marryus.member.service.MemberServiceImpl;
import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.General;
import kr.co.marryus.repository.domain.Member;

/**
 * 회원가입 controller
 * @author suzie
 *
 */
@Controller("kr.co.marryus.member.controller.SignUpController")
@RequestMapping("/signup")
public class SignUpController {

	/**
	 * 멤버 service 
	 */
	@Autowired
	private MemberServiceImpl service;
	
	/**
	 * spring security 비밀번호 암호화 
	 */
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping("/signupGeneral.do")
	public void signUpMainGeneral() {}
	
	@RequestMapping("/signupCompany.do")
	public void signUpMainCompany() {}
	
	@RequestMapping("/signupPro.do")
	public void signUpPro() {}
	
	/**
	 * 
	 * 회원가입 일반 
	 */
	@RequestMapping("/general.do")
	public String signUpGeneral(Member member, General general) {
		//비밀번호암호화 
		String rawPassword = member.getPass();
		 
		member.setPass(passwordEncoder.encode(rawPassword));
		
		//1. Member 등록 
		service.insertMember(member);
		//2. 회원번호 받기
		int no = member.getNo();
		//3.일반회원에 회원번넘버 셋팃
		general.setGenNo(no);
		//4.일반회원 등록 
		service.insertGeneral(general);
		return "redirect:/main/main.do";
	}
	
	/**
	 * 
	 * 회원가입 업체 
	 */
	@RequestMapping("/company.do")
	public String signUpGeneral(Member member, Company company) {
		//비밀번호암호화 
		String rawPassword = member.getPass();
		
		member.setPass(passwordEncoder.encode(rawPassword));
		
		//1. Member 등록 
		service.insertMember(member);
		//2. 회원번호 받기
		int no = member.getNo();
		//3.업체회원에 번호 셋팅
		company.setComNo(no);
		//4.업체회원 등록 
		service.insertCompany(company);
		return "redirect:/main/main.do";
	}
}
