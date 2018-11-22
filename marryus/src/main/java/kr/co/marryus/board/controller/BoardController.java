package kr.co.marryus.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.marryus.board.service.BoardService;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.PageSearch;
import kr.co.marryus.repository.mapper.BoardMapper;

@Controller("kr.co.marryus.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/notice/list.do")
//	public List<Board> boardList(){
//		List<Board> list = new ArrayList<Board>();
//		return service.boardList();
//	}
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
}