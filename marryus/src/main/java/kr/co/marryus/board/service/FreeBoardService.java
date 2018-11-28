package kr.co.marryus.board.service;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;

public interface FreeBoardService {
	
	List<Board> freeBoardList(Page page);
	int selectFreeBoardCount();
	Board freeBoardDetail(int boardNo);
	void writeFreeBoard(Board board);
	void freeBoardDelete(int boardNo);
	void updateFreeBoard(Board board);
	void updateFreeBoardCnt(int boardNo);
	List<Comment> freeCommentList(int boardNo);
	void writeFreeComment(Comment comment);
	void deleteFreeComment(int commNo);
	void updateFreeComment(Comment comment);
	int checkFreeRecomm(Recomm recomm);
	int selectFreeRecommCount(int boardNo);
	void insertFreeRecomm(Recomm recomm);
	void deleteFreeRecomm(Recomm recomm);
}
