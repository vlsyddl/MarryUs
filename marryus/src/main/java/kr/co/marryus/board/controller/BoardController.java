package kr.co.marryus.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.marryus.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {
	@RequestMapping("/notice/list.do")
	public void weddingHall() {}
}
