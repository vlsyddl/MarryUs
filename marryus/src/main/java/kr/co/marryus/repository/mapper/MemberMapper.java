package kr.co.marryus.repository.mapper;

import kr.co.marryus.repository.domain.Member;

public interface MemberMapper {
	Member login(Member member);
	Member loginGeneral(Member member);
	Member loginCompany(Member member);
}
