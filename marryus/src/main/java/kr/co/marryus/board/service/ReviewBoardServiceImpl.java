package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.mapper.ReviewBoardMapper;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Autowired
	private ReviewBoardMapper mapper;
	
	@Override
	public List<Board> reviewBoardList(Page page){
		return mapper.selectReviewBoardList(page);
	} // boardList

	@Override
	public int selectReviewBoardCount() {
		return mapper.selectReviewBoardCount();
	} // selectBoardCount

	@Override
	public Board reviewBoardDetail(int boardNo) {
		return mapper.selectReviewBoardDetail(boardNo);
	}
	
	@Override
	public Attach reviewAttachDetail(int boardNo) {
		return mapper.selectReviewDetailAttach(boardNo);
	}
	
	@Override
	public void writeReviewBoard(Board board) {
		mapper.insertReviewBoard(board);
	}
	
	@Override
	public void writeReviewFile(Attach attach) {
		mapper.insertReviewFile(attach);
	}

	@Override
	public void reviewBoardDelete(int boardNo) {
		mapper.deleteReviewBoard(boardNo);
	}

	@Override
	public void updateReviewBoardCnt(int boardNo) {
		mapper.updateReviewBoardCnt(boardNo);
	}

	@Override
	public void updateReviewBoard(Board board) {
		mapper.updateReviewBoard(board);
	}

	@Override
	public void updateReviewFile(Attach attach) {
		mapper.updateReviewFile(attach);
	}

	@Override
	public List<Comment> reviewCommentList(int boardNo) {
		return mapper.selectReviewCommentList(boardNo);
	}

	@Override
	public void writeReviewComment(Comment comment) {
		mapper.insertReviewComment(comment);
	}

	@Override
	public void deleteReviewComment(int commNo) {
		mapper.deleteReviewComment(commNo);
	}

	@Override
	public void updateReviewComment(Comment comment) {
		mapper.updateReviewComment(comment);
	}

	@Override
	public int checkReviewRecomm(Recomm recomm) {
		return mapper.selectCheckRecomm(recomm);
	}

	@Override
	public int selectReviewRecommCount(int boardNo) {
		return mapper.selectReviewBoardRecomm(boardNo);
	}

	@Override
	public void insertReviewRecomm(Recomm recomm) {
		mapper.insertReviewBoardRecomm(recomm);
	}

	@Override
	public void deleteReviewRecomm(Recomm recomm) {
		mapper.deleteReviewBoardRecomm(recomm);
	}

	@Override
	public List<Board> reviewSearch(Search search) {
		return mapper.selectReviewSearch(search);
	}

	@Override
	public int selectReviewSearchCount(Search search) {
		return mapper.selectReviewSearchCnt(search);
	}

} // end class
