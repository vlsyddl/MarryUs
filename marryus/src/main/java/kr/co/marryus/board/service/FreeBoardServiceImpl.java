package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.mapper.BoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	public List<Board> boardList(Page page){
		return mapper.boardList(page);
	} // boardList

	@Override
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	} // selectBoardCount

} // end class
