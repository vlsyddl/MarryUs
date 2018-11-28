package kr.co.marryus.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Company;
import kr.co.marryus.repository.domain.General;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.mapper.MemberMapper;

/**
 * MemberServiceImpl 회원에 대한 로직처리
 * @author suzie
 *
 */
@Service
public class MemberServiceImpl implements MemberService{
	
	/**
	 *  mapper 멤버필드 
	 */
	@Autowired
	private MemberMapper mapper;
	
	/**
	 * 비밀번호 암호화 처리 멤버 필드
	 */
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/**
	 * 로그인 처리.1 - member
	 */
	@Override
	public Member login(Member member) {
		return mapper.login(member);
	}
	
	/**
	 * 로그인 처리.2-1 - 일반회원
	 */
	@Override
	public Member loginGeneral(Member member) {
		return mapper.loginGeneral(member);
	}

	/**
	 * 로그인 처리.2-2 - 기업회원
	 */
	@Override
	public Member loginCompany(Member member) {
		return mapper.loginCompany(member);
	}

	/**
	 * 회원가입 처리 1. member
	 *  return값 회원넘버 
	 */
	@Override
	public int insertMember(Member member) {
		mapper.insertMember(member);
		return member.getNo();
	}

	/**
	 * 회원가입 처리 2-1 - 일반회원
	 */
	@Override
	public void insertGeneral(General general) {
		mapper.insertGeneral(general);
		
	}
	
	/**
	 * 회원가입 처리 2-2 - 기업회원
	 */
	@Override
	public void insertCompany(Company company) {
		mapper.insertCompany(company);
	}

	/**
	 * 비밀번호 찾는 로직 - 이메일+이름
	 */
	@Override
	public Member findId(Member member) {
		
		return mapper.findId(member);
	}

	/**
	 * 새로운 비밀번호 업데이트하기 
	 */
	@Override
	public void updateNewPass(Member member) {
		mapper.updateNewPass(member);
		
	}

}
