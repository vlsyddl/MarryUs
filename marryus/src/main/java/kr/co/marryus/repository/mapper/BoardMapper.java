package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;

public interface BoardMapper {
	
	List<Board> boardList(Page page);
	int selectBoardCount();

}
