package kr.co.marryus.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Member;
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




}
