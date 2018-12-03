package kr.co.marryus.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Answer;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.SearchForm;
import kr.co.marryus.repository.domain.SearchUser;
import kr.co.marryus.repository.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	
	@Override
	public Admin selectAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.selectAdmin(admin);
	}


	@Override
	public int signUpAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.signUpAdmin(admin);
	}


	@Override
	public List countConnection() {
		// TODO Auto-generated method stub
		return mapper.countConnection();
	}


	@Override
	public List<Board> selectNoAnswerBoard() {
		// TODO Auto-generated method stub
		return 	mapper.selectNoAnswerBoard();
	}


	@Override
	public HashMap<String, Object> memberCount() {
		// TODO Auto-generated method stub
		return mapper.memberCount();
	}


	@Override
	public HashMap<String, Object> auctoinCount() {
		// TODO Auto-generated method stub
		return mapper.auctoinCount();
	}


	@Override
	public List<Member> noAgreeMember() {
		// TODO Auto-generated method stub
		return mapper.noAgreeMember();
	}


	@Override
	public List<Board> boardList(SearchForm searchForm) {
		// TODO Auto-generated method stub
		return mapper.boardList(searchForm);
	}


	@Override
	public int boardCount(SearchForm searchForm) {
		// TODO Auto-generated method stub
		return mapper.boardCount(searchForm);
	}


	@Override
	public Board boardDetail(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.boardDetail(boardNo);
	}


	@Override
	public int boardInsert(Board board) {
		// TODO Auto-generated method stub
		return mapper.boardInsert(board);
	}


	@Override
	public int boardDelete(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.boardDelete(boardNo);
	}


	@Override
	public int boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return mapper.boardUpdate(board);
	}


	@Override
	public int answerInsert(Answer answer) {
		// TODO Auto-generated method stub
		return mapper.answerInsert(answer);
	}


	@Override
	public Answer answerDetail(int questionNo) {
		// TODO Auto-generated method stub
		return mapper.answerDetail(questionNo);
	}


	@Override
	public int answerUpdate(Answer answer) {
		// TODO Auto-generated method stub
		return mapper.answerUpdate(answer);
	}


	@Override
	public int answerDelete(int answerNo) {
		// TODO Auto-generated method stub
		return mapper.answerDelete(answerNo);
	}


	@Override
	public int answerStatUpdate(int boardNo) {
		// TODO Auto-generated method stub
		return mapper.answerStatUpdate(boardNo);
	}


	@Override
	public List<Board> faqList() {
		// TODO Auto-generated method stub
		return mapper.faqList();
	}


	@Override
	public List<Member> userList(SearchUser searchUser) {
		// TODO Auto-generated method stub
		return mapper.userList(searchUser);
	}


	@Override
	public int userCount(SearchUser searchUser) {
		// TODO Auto-generated method stub
		return mapper.userCount(searchUser);
	}


	@Override
	public List<Admin> admList(SearchUser searchUser) {
		// TODO Auto-generated method stub
		return mapper.admList(searchUser);
	}


	@Override
	public int admCount(SearchUser searchUser) {
		// TODO Auto-generated method stub
		return mapper.admCount(searchUser);
	}


	@Override
	public int userStatusUpdate(Company company) {
		// TODO Auto-generated method stub
		return mapper.userStatusUpdate(company);
	}


	@Override
	public int adminStatusUpdate(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.adminStatusUpdate(admin);
	}


	@Override
	public int adminTypeUpdate(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.adminTypeUpdate(admin);
	}

	
	
	

}
