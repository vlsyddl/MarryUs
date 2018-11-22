package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;

public interface FreeBoardMapper {
	
	List<Board> selectFreeBoardList(Page page);
	int selectFreeBoardCount();
	Board selectFreeBoardDetail(int boardNo);
	String insertFreeBoard(Board board);
}
