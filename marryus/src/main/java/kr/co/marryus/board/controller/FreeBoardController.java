package kr.co.marryus.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.board.service.FreeBoardService;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;

@Controller("kr.co.marryus.board.controller.FreeBoardController")
@RequestMapping("/board")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/free/list.do")
	public void boardList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Board board) throws Exception {
		Page page = new Page();
		page.setPageNo(pageNo);

		// 총 게시글 수 표시
		int count = service.selectFreeBoardCount();
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
		model.addAttribute("freeList", service.freeBoardList(page));
		model.addAttribute("count", service.selectFreeBoardCount());
	}
	
	@RequestMapping("/free/detail.do")
	public void freeDetail(Model model, int boardNo) {
		model.addAttribute("freeDetail", service.freeBoardDetail(boardNo));
	}
	
	@RequestMapping("/free/writeForm.do")
	public void writeForm() {
	}
	
	@RequestMapping("/free/write.do")
	public String write(Board board) {
		service.writeFreeBoard(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
