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
import kr.co.marryus.repository.domain.Answer;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.PageResult;
import kr.co.marryus.repository.domain.SearchForm;
import kr.co.marryus.repository.domain.SearchUser;

@Controller("kr.co.marryus.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	/*
	 * 관리자 로그인화면
	 */
	@RequestMapping("/index.do")
	public void intro() {}

	/**
	 * 관리자 로그인
	 * @param admin
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * 관리자 회원가입
	 * @param admin
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/signup.do")
	public String signup(Admin admin, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(service.signUpAdmin(admin));
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('관리자 승인후 로그인이 가능합니다.'); history.go(-1);</script>");
        out.flush();
		return null;
		
	}
	
	/**
	 * 	관리자 로그아웃	
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+ "index.do"; 
	}
	
	/**
	 * 관리자 메인화면
	 */
	@RequestMapping("/main.do")
	public void main() {}
	
	/**
	 * 접속자 통계
	 * @return
	 */
	@RequestMapping("/countConnection.do")
	@ResponseBody
	public List countConnection(){
		return service.countConnection();
	}
	
	/**
	 * 답변안된 질문
	 * @return
	 */
	@RequestMapping("/noAnswerBoard.do")
	@ResponseBody
	public List<Board> selectNoAnswerBoard(){
		return service.selectNoAnswerBoard();
	}
	
	/**
	 * 회원 통계
	 * @return
	 */
	@RequestMapping("/countMember.do")
	@ResponseBody
	public HashMap<String,Object> countMemberO(){
		return service.memberCount();
	}
	
	/**
	 * 경매 통계
	 * @return
	 */
	@RequestMapping("/countAuction.do")
	@ResponseBody
	public HashMap<String,Object> countAuction(){
		return service.auctoinCount();
	}
	
	/**
	 * 승인 안된 회원
	 * @return
	 */
	@RequestMapping("/noAgreeMember.do")
	@ResponseBody
	public List<Member> noAgreeMember(){
		return service.noAgreeMember();
	}
	
	/**
	 * 관리자 게시판
	 */
	@RequestMapping("/board.do")
	public void board() {}
	
	/**
	 * 게시판 리스트 통합
	 * @param searchForm
	 * @return
	 */
	@RequestMapping("/boardList.do")
	@ResponseBody
	public HashMap<String,Object> boardList(SearchForm searchForm){
		HashMap<String, Object> listMap = new HashMap();
		List<Board> list = service.boardList(searchForm);
		listMap.put("list", list);
		listMap.put("pageResult",new PageResult(searchForm.getPageNo(),service.boardCount(searchForm),10,5));
		
		return listMap;
	}
	
	/**
	 * 게시판 디테일
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/boardDetail.do")
	@ResponseBody
	public Board boardDetail(int boardNo) {
		return service.boardDetail(boardNo);
	}
	
	/**
	 * 게시판 입력
	 * @param board
	 * @return
	 */
	@RequestMapping("/boardInsert.do")
	@ResponseBody
	public String boardInsert(Board board) {
		String result = "";
		if(service.boardInsert(board)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 게시판 삭제
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String boardDelete(int boardNo) {
		String result = "";
		if(service.boardDelete(boardNo)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 게시판 수정
	 * @param board
	 * @return
	 */
	@RequestMapping("/boardUpdate.do")
	@ResponseBody
	public String boardUpdate(Board board) {
		String result = "";
		if(service.boardUpdate(board)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 답글 입력
	 * @param answer
	 * @return
	 */
	@RequestMapping("/answerInsert.do")
	@ResponseBody
	public String answerInsert(Answer answer) {
		String result = "";
		if(service.answerInsert(answer)==1) {
			service.answerStatUpdate(answer.getQuestionNo());
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 답글 디테일
	 * @param questionNo
	 * @return
	 */
	@RequestMapping("/answerDetail.do")
	@ResponseBody
	public Answer answerDetail(int questionNo) {
		return service.answerDetail(questionNo);
	}
	
	/**
	 * 답글 수정
	 * @param answer
	 * @return
	 */
	@RequestMapping("/answerUpdate.do")
	@ResponseBody
	public String answerUpdate(Answer answer) {
		String result = "";
		if(service.answerUpdate(answer)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 답글 삭제
	 * @param answerNo
	 * @return
	 */
	@RequestMapping("/answerDelete.do")
	@ResponseBody
	public String answerDelete(int answerNo) {
		String result = "";
		if(service.answerDelete(answerNo)==1) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}
	
	/**
	 * faq 리스트
	 * @return
	 */
	@RequestMapping("/faqList.do")
	@ResponseBody
	public List<Board> faqList(){
		return service.faqList();
	}
	
	@RequestMapping("/user.do")
	public void user() {}
	
	@RequestMapping("/userList.do")
	@ResponseBody
	public HashMap<String,Object> userList(SearchUser searchUser){
		HashMap<String, Object> listMap = new HashMap();
		List<Member> list = service.userList(searchUser);
		listMap.put("list", list);
		listMap.put("pageResult",new PageResult(searchUser.getPageNo(),service.userCount(searchUser),10,5));
		
		return listMap;
	}
}
