package kr.co.marryus.repository.mapper;

import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.General;
import kr.co.marryus.repository.domain.Member;
/**
 * member mapper
 * @author suzie
 *
 */
public interface MemberMapper {
	// 로그인
	Member login(Member member);
	Member loginGeneral(Member member);
	Member loginCompany(Member member);
	
	// 회원가입
	int insertMember(Member member);
	void insertGeneral(General general);
	void insertCompany(Company company);
	
	//비밀번호 찾기
	int findId(Member member);
	void updateNewPass(Member member);
	//todoList 생성
	void insertCopyTable(int memNo);
}
