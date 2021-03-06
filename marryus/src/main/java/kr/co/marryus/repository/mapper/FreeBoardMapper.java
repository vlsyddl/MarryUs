package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;

public interface FreeBoardMapper {
	
	List<Board> selectFreeBoardList(Page page);
	int selectFreeBoardCount();
	Board selectFreeBoardDetail(int boardNo);
	void insertFreeBoard(Board board);
	void deleteFreeBoard(int boardNo);
	void updateFreeBoardCnt(int boardNo);
	void updateFreeBoard(Board board);
	List<Comment> selectFreeCommentList(int boardNo);
	void insertFreeComment(Comment comment);
	void deleteFreeComment(int commNo);
	void updateFreeComment(Comment comment);
	int selectCheckRecomm(Recomm recomm);
	int selectFreeBoardRecomm(int boardNo);
	void insertFreeBoardRecomm(Recomm recomm);
	void deleteFreeBoardRecomm(Recomm recomm);
	List<Board> selectFreeSearch(Search search);
	int selectFreeSearchCnt(Search search);
}
