package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Attach;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Comment;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.SearchForm;


public interface BoardMapper {
	List<Board> boardList(SearchForm form);
	int boardCount(SearchForm form);
	Board boardDetail(int boardNo);
	List<Board> reviewList(SearchForm form);
	List<Comment> boardComment(int boardNo); 
	int boardWrite(Board board);
	int attachFile(Attach attach);
	Attach attachDetail(int boardNo);
	int updateBoard(Board board);
	int updateAttach(Attach attach);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteBoard(int boardNo);
	int deleteComment(int commNo);
}
