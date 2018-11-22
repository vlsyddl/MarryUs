package kr.co.marryus.repository.mapper;

import java.util.List;


import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Page2;

public interface BoardMapper {
	
	List<Board> boardList(Page page);
	Board noticeDetailBoard(int no);
	void listNoticeUpdateView(int no);
	
	
	int selectBoardCount();
	
	List<Board> categoryList(Page2 page);
	int categoryCount(Page2 page);

}
