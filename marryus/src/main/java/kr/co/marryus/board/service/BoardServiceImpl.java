package kr.co.marryus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.SearchForm;
import kr.co.marryus.repository.mapper.BoardMapper;

/**
 * @author Qandi
 *
 */
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	

	@Override
	public List<Board> boardList(SearchForm form) {
		// TODO Auto-generated method stub
		return mapper.boardList(form);
	}


	@Override
	public int boardCount(SearchForm form) {
		// TODO Auto-generated method stub
		return mapper.boardCount(form);
	}
	
	@Override
	public Board boradDetail(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.boardDetail(boardNo);
	}


	@Override
	public List<Comment> boardComment(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.boardComment(boardNo);
	}


	@Override
	public List<Board> reviewList(SearchForm form) {
		// TODO Auto-generated method stub
		return mapper.reviewList(form);
	}


	@Override
	public int boardWrite(Board board) {
		// TODO Auto-generated method stub
		return mapper.boardWrite(board);
	}


	@Override
	public int attachFile(Attach attach) {
		// TODO Auto-generated method stub
		return mapper.attachFile(attach);
	}


	@Override
	public Attach attachDetail(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.attachDetail(boardNo);
	}


	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return mapper.updateBoard(board);
	}


	@Override
	public int updateAttach(Attach attach) {
		// TODO Auto-generated method stub
		return mapper.updateAttach(attach);
	}


	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return mapper.insertComment(comment);
	}


	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return mapper.updateComment(comment);
	}


	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.deleteBoard(boardNo);
	}


	@Override
	public int deleteComment(int commNo) {
		// TODO Auto-generated method stub
		return mapper.deleteComment(commNo);
	}
	
	
}
