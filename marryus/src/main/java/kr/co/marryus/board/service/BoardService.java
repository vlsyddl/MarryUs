package kr.co.marryus.board.service;

import java.util.List;


import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Page2;

public interface BoardService {
	
	List<Board> boardList(Page page);
	Board noticeDetail(int no);
	int selectBoardCount();
	
	List<Board> category(Page2 page);

	int categoryCount(Page2 page);

	
}
