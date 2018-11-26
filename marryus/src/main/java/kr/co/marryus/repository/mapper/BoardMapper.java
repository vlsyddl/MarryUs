package kr.co.marryus.repository.mapper;

import java.util.List;


import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;


public interface BoardMapper {
	// 공지게시판
	List<Board> boardList(Page page);
	Board noticeDetailBoard(int no);
	void listNoticeUpdateView(int no);
	int selectBoardCount();
	
	
	// 1대1 게시판
	List<Board> mtomList(Page page);
	Board mtomDetailBoard(int no);
	void listMtoMUpdateView(int no);
	int selectMtoMBoardCount();
	void insertMtom(Board board);
	void mtomdelete(int no);
	void mtomUpdate(Board board);

	//댓글
	List<Comment> listComment(int boardNo);

}
