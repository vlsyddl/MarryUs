package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;

public interface ReviewBoardMapper {
	
	List<Board> selectReviewBoardList(Page page);
	int selectReviewBoardCount();
	Board selectReviewBoardDetail(int boardNo);
	Attach selectReviewDetailAttach(int boardNo);
	void insertReviewBoard(Board board);
	void insertReviewFile(Attach attach);
	void deleteReviewBoard(int boardNo);
	void updateReviewBoardCnt(int boardNo);
	void updateReviewBoard(Board board);
	void updateReviewFile(Attach attach);
	List<Comment> selectReviewCommentList(int boardNo);
	void insertReviewComment(Comment comment);
	void deleteReviewComment(int commNo);
	void updateReviewComment(Comment comment);
	int selectCheckRecomm(Recomm recomm);
	int selectReviewBoardRecomm(int boardNo);
	void insertReviewBoardRecomm(Recomm recomm);
	void deleteReviewBoardRecomm(Recomm recomm);
	List<Board> selectReviewSearch(Search search);
	int selectReviewSearchCnt(Search search);
}
