package kr.co.marryus.board.service;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;

public interface FreeBoardService {
	
	List<Board> freeBoardList(Page page);
	int selectFreeBoardCount();
	Board freeBoardDetail(int boardNo);
	void writeFreeBoard(Board board);
	void freeBoardDelete(int boardNo);
	void updateFreeBoard(Board board);
	void updateFreeBoardCnt(int boardNo);
	List<Comment> freeCommentList(int boardNo);
}
