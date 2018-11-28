package kr.co.marryus.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.board.service.FreeBoardService;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;

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
		service.updateFreeBoardCnt(boardNo);
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
	
	@RequestMapping("/free/delete.do")
	public String delete(int boardNo) {
		service.freeBoardDelete(boardNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("/free/updateForm.do")
	public void updateForm(Model model, int boardNo) {
		model.addAttribute("freeDetail", service.freeBoardDetail(boardNo));
	}

	@RequestMapping("/free/update.do")
	public String update(Board board) {
		service.updateFreeBoard(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("/free/commentList.json")
	@ResponseBody
	public List<Comment> commentList(int boardNo) throws Exception {
		return service.freeCommentList(boardNo);
	}
	
	@RequestMapping("/free/commentWrite.json")
	@ResponseBody
	public void commentWrite(Comment comment) {
		service.writeFreeComment(comment);
	}
	
	@RequestMapping("/free/commentDelete.json")
	@ResponseBody
	public void commentDelete(int commNo) {
		service.deleteFreeComment(commNo);
	}
	
	@RequestMapping("/free/commentUpdate.json")
	@ResponseBody
	public void commentUpdate(Comment comment) {
		service.updateFreeComment(comment);
	}
	
	@RequestMapping("/free/recommCheck.json")
	@ResponseBody
	public int recommCheck(Recomm recomm) {
		return service.checkFreeRecomm(recomm);
	}
	
	@RequestMapping("/free/recommCount.json")
	@ResponseBody
	public int recommCount(int boardNo) {
		return service.selectFreeRecommCount(boardNo);
	}
	
	@RequestMapping("/free/recomm.json")
	@ResponseBody
	public void recomm(Recomm recomm) {
		service.insertFreeRecomm(recomm);
	}
	
	@RequestMapping("/free/recommCancle.json")
	@ResponseBody
	public void recommCancle(Recomm recomm) {
		service.deleteFreeRecomm(recomm);
	}
}
