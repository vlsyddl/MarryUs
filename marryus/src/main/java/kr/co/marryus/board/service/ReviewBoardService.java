package kr.co.marryus.board.service;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;

public interface ReviewBoardService {
	
	List<Board> reviewBoardList(Page page);
	int selectReviewBoardCount();
	Board reviewBoardDetail(int boardNo);
	Attach reviewAttachDetail(int boardNo);
	void writeReviewBoard(Board board);
	void writeReviewFile(Attach attach);
	void reviewBoardDelete(int boardNo);
	void updateReviewBoardCnt(int boardNo);
	void updateReviewBoard(Board board);
	void updateReviewFile(Attach attach);
	List<Comment> reviewCommentList(int boardNo);
	void writeReviewComment(Comment comment); 
	void deleteReviewComment(int commNo);
	void updateReviewComment(Comment comment);
	int checkReviewRecomm(Recomm recomm);
	int selectReviewRecommCount(int boardNo);
	void insertReviewRecomm(Recomm recomm);
	void deleteReviewRecomm(Recomm recomm);
	List<Board> reviewSearch(Search search);
	int selectReviewSearchCount(Search search);
}
