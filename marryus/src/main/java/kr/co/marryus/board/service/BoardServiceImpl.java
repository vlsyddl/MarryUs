package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	public List<Board> boardList(Page page){
		return mapper.boardList(page);
		
	}
	
	@Override
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}

	@Override
	public Board noticeDetail(int no) {
		mapper.listNoticeUpdateView(no);
		return mapper.noticeDetailBoard(no);
	}


	@Override
	public List<Board> mtomList(Page page) {
		return mapper.mtomList(page);
	}
	
	@Override
	public Board mtomDetail(int no) {
		mapper.listMtoMUpdateView(no);
		return mapper.mtomDetailBoard(no);
	}

	@Override
	public int selectMtoMBoardCount() {
		return mapper.selectMtoMBoardCount();
	}

	@Override
	public void writeMtomBoard(Board board) {
		 mapper.insertMtom(board);
	}

	@Override
	public void deleteMtoMBoard(int no) {
		mapper.mtomdelete(no);
		
	}

	@Override
	public void mtomUpdate(Board board) {
		mapper.mtomUpdate(board);
		
	}

	


}
