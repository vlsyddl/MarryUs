package kr.co.marryus.member.service;

import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.General;
import kr.co.marryus.repository.domain.Member;

/**
 * Member service 회원들의 서비스 인터페이스 
 * @author suzie
 *
 */
public interface MemberService {
	/**
	 * 로그인 
	 * @param member
	 * @return
	 */
	Member login(Member member);
	
	/**
	 * 일반회원 로그인 
	 * @param member
	 * @return
	 */
	Member loginGeneral(Member member);
	
	/**
	 * 기업회원 로그인
	 * @param member
	 * @return
	 */
	Member loginCompany(Member member);
	
	
	/**
	 * 회원가입 1.member
	 * @param member
	 * @return
	 */
	int insertMember(Member member);
	
	/**
	 * 회원가입 2-1.일반회원
	 * @param general
	 */
	void insertGeneral(General general);
	
	/**
	 * 회원가입 2-2.기업회원
	 * @param company
	 */
	void insertCompany(Company company);

}
