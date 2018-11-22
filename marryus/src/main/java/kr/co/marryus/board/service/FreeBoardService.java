package kr.co.marryus.board.service;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;

public interface FreeBoardService {
	
	List<Board> freeBoardList(Page page);
	int selectFreeBoardCount();
	Board freeBoardDetail(int boardNo);
	String writeFreeBoard(Board board);
}
