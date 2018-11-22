package kr.co.marryus.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.marryus.board.service.BoardService;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;

@Controller("kr.co.marryus.board.controller.FreeBoardController")
@RequestMapping("/board")
public class FreeBoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/free/list.do")
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
		model.addAttribute("list", service.boardList(page));
		model.addAttribute("count", service.selectBoardCount());
	}
}
