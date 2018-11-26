package kr.co.marryus.board.service;

import java.util.List;


import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;


public interface BoardService {
	
	List<Board> boardList(Page page);
	Board noticeDetail(int no);
	int selectBoardCount();
	
	// 1대1
	List<Board> mtomList(Page page);
	Board mtomDetail(int no);
	int selectMtoMBoardCount();
	void writeMtomBoard(Board board);
	void deleteMtoMBoard(int no);
	void mtomUpdate(Board board);
	
	
	// 댓글
	List<Comment> listComment(int boardNo);
}
