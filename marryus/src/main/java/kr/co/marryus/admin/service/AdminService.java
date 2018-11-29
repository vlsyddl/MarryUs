package kr.co.marryus.admin.service;

import java.util.HashMap;
import java.util.List;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Answer;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.SearchForm;

public interface AdminService {
	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
	List countConnection();
	List<Board> selectNoAnswerBoard();
	HashMap<String, Object> memberCount();
	HashMap<String, Object> auctoinCount();
	List<Member> noAgreeMember();
	List<Board> boardList(SearchForm searchForm);
	int boardCount(SearchForm searchForm);
	Board boardDetail(int boardNo);
	int boardInsert(Board board);
	int boardDelete(int boardNo);
	int boardUpdate(Board board);
	int answerInsert(Answer answer);
	Answer answerDetail(int questionNo);
	int answerUpdate(Answer answer);
	int answerDelete(int answerNo);
}
