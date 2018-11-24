package kr.co.marryus.repository.mapper;

import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.General;
import kr.co.marryus.repository.domain.Member;

public interface MemberMapper {
	Member login(Member member);
	Member loginGeneral(Member member);
	Member loginCompany(Member member);
	
	// 로그인 - 일반
	int insertMember(Member member);
	void insertGeneral(General general);
	
	void insertCompany(Company company);
}
