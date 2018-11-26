package kr.co.marryus.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;


import kr.co.marryus.board.service.BoardService;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.mapper.BoardMapper;

@Controller("kr.co.marryus.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 공지사항 리스트
	@RequestMapping("/notice/list.do")
	public void boardList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Board board) throws Exception {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.selectBoardCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		model.addAttribute("list", service.boardList(page));
		model.addAttribute("count", service.selectBoardCount());
	}
	
	// 공지사항 디테일
	@RequestMapping("/notice/detail.do")
	public void noticeDetail(Model model, int no) {
		model.addAttribute("board", service.noticeDetail(no));
	}
	
	
	// 1대1 문의 리스트
	@RequestMapping("/mtom/mtomlist.do")
	public void mtomList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Board board) throws Exception {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.selectMtoMBoardCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		model.addAttribute("list", service.mtomList(page));
		model.addAttribute("count", service.selectMtoMBoardCount());
	}
	
	// 1대1 문의 디테일
	@RequestMapping("/mtom/mtomdetail.do")
	public void mtomDetail(Model model, int no) {
		model.addAttribute("board", service.mtomDetail(no));
	}
	
	@RequestMapping("/mtom/mtomwriteForm.do")
	public void writeForm() {
	}
	// 1대1 문의 작성
	@RequestMapping("/mtom/mtomwrite.do")
	public String write(Board board) {
		service.writeMtomBoard(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mtomlist.do";
	}
	
	// 1대1 문의 삭제
	@RequestMapping("/mtom/mtomdelete.do")
	public String delete(int no) {
		service.deleteMtoMBoard(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mtomlist.do";
	}
	// 1대1 문의 수정
	@RequestMapping("/mtom/mtomupdateForm.do")
	public void updateForm(Model model, int no) {
		model.addAttribute("board", service.mtomDetail(no));
	}

	@RequestMapping("/mtom/mtomupdate.do")
	public String update(Board board) {
		service.mtomUpdate(board);
		System.out.println(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mtomlist.do";
	}
	
	// 1대1 문의 수정
	@RequestMapping("/mtom/listComment.do")
    @ResponseBody
    public List<Comment> commentList(int boardNo) throws Exception {
		System.out.println("boardNo" + boardNo);
    	return service.listComment(boardNo);
    }
	
	
}
