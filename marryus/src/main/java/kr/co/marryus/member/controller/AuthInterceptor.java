package kr.co.marryus.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.marryus.repository.domain.Member;
// AuthIntercepter를 스프링에 환경설정에 등록해준다. 


/**
 * 인터 셉터 
 * @author suzie
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("user");
		if(m != null) {
			return true;
		}
		System.out.println("인증 인터셉터에 로그인 부분이 안되었음이 걸렸음..");
		response.sendRedirect("/marryus/main/main.do");
		return false;
	}
	
}
