package kr.co.marryus.repository.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.Member;

public interface AdminMapper {

	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
	List countConnection();
	List<Board> selectNoAnswerBoard();
	HashMap<String, Object> memberCount();
	HashMap<String, Object> auctoinCount();
	List<Member> noAgreeMember();
}
