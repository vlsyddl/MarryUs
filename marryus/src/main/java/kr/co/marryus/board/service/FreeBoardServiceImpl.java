package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Recomm;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.mapper.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Autowired
	private FreeBoardMapper mapper;
	
	@Override
	public List<Board> freeBoardList(Page page){
		return mapper.selectFreeBoardList(page);
	} // boardList

	@Override
	public int selectFreeBoardCount() {
		return mapper.selectFreeBoardCount();
	} // selectBoardCount

	@Override
	public Board freeBoardDetail(int boardNo) {
		return mapper.selectFreeBoardDetail(boardNo);
	}

	@Override
	public void writeFreeBoard(Board board) {
		mapper.insertFreeBoard(board);
	}

	@Override
	public void freeBoardDelete(int boardNo) {
		mapper.deleteFreeBoard(boardNo);
	}

	@Override
	public void updateFreeBoard(Board board) {
		mapper.updateFreeBoard(board);
	}

	@Override
	public List<Comment> freeCommentList(int boardNo) {
		return mapper.selectFreeCommentList(boardNo);
	}

	@Override
	public void updateFreeBoardCnt(int boardNo) {
		mapper.updateFreeBoardCnt(boardNo);
	}

	@Override
	public void writeFreeComment(Comment comment) {
		mapper.insertFreeComment(comment);
	}

	@Override
	public void deleteFreeComment(int commNo) {
		mapper.deleteFreeComment(commNo);
	}

	@Override
	public void updateFreeComment(Comment comment) {
		mapper.updateFreeComment(comment);
	}

	@Override
	public int checkFreeRecomm(Recomm recomm) {
		return mapper.selectCheckRecomm(recomm);
	}

	@Override
	public int selectFreeRecommCount(int boardNo) {
		return mapper.selectFreeBoardRecomm(boardNo);
	}

	@Override
	public void insertFreeRecomm(Recomm recomm) {
		mapper.insertFreeBoardRecomm(recomm);
	}

	@Override
	public void deleteFreeRecomm(Recomm recomm) {
		mapper.deleteFreeBoardRecomm(recomm);
	}

	@Override
	public List<Board> freeSearch(Search search) {
		return mapper.selectFreeSearch(search);
	}

	@Override
	public int selectFreeSearchCount(Search search) {
		return mapper.selectFreeSearchCnt(search);
	}
	
} // end class
