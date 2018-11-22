package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.mapper.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Autowired
	private FreeBoardMapper mapper;
	
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
	public String writeFreeBoard(Board board) {
		return mapper.insertFreeBoard(board);
	}
	
} // end class
