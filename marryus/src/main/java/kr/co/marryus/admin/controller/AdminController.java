package kr.co.marryus.admin.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.admin.service.AdminService;
import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Member;

@Controller("kr.co.marryus.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/index.do")
	public void intro() {}
	
	@RequestMapping("/login.do")
	public String login(Admin admin,HttpServletRequest request
            , HttpServletResponse response,HttpSession session) throws Exception {
		Admin adm  = service.selectAdmin(admin);

		String result = null;
		if(adm==null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
		}else {
			session.setAttribute("admin", adm);
			result = UrlBasedViewResolver.REDIRECT_URL_PREFIX+ "main.do"; 
		}
		return result;
	}
	
	@RequestMapping("/signup.do")
	public String signup(Admin admin, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(service.signUpAdmin(admin));
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('관리자 승인후 로그인이 가능합니다.'); history.go(-1);</script>");
        out.flush();
		return null;
		
	}
	
	/**  로그아웃    */	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+ "index.do"; 
	}
	
	@RequestMapping("/main.do")
	public void main() {}
	
	@RequestMapping("/countConnection.do")
	@ResponseBody
	public List countConnection(){
		return service.countConnection();
	}
	
	@RequestMapping("/noAnswerBoard.do")
	@ResponseBody
	public List<Board> selectNoAnswerBoard(){
		return service.selectNoAnswerBoard();
	}
	
	@RequestMapping("/countMember.do")
	@ResponseBody
	public HashMap<String,Object> countMemberO(){
		return service.memberCount();
	}
	
	@RequestMapping("/countAuction.do")
	@ResponseBody
	public HashMap<String,Object> countAuction(){
		return service.auctoinCount();
	}
	
	@RequestMapping("/noAgreeMember.do")
	@ResponseBody
	public List<Member> noAgreeMember(){
		return service.noAgreeMember();
	}
}
