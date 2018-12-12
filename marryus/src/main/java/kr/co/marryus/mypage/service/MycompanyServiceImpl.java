package kr.co.marryus.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.mapper.MycompanyMapper;
import kr.co.marryus.repository.mapper.MypageMapper;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;
import kr.co.marryus.repository.domain.Venue;


@Service
public class MycompanyServiceImpl implements MycompanyService{
	@Autowired
	MycompanyMapper mapper;

	@Override
	public List<CompanyInfo> selectComInfoList(int memNo) {
		return mapper.selectComInfoList(memNo);
	}

	@Override
	public String[] selectComInfoType(int memNo) {
		return mapper.selectComInfoType(memNo);
	}

	@Override
	public CompanyInfo selectComInfoDetail(CompanyInfo comInfo) {
		return mapper.selectComInfoDetail(comInfo);
	}

	@Override
	public int insertComInfo(CompanyInfo comInfo) {
		return mapper.insertComInfo(comInfo);
	}

	@Override
	public int updateComInfo(CompanyInfo comInfo) {
		return mapper.updateComInfo(comInfo);
	}

	@Override
	public int deleteComInfo(int comInfoNo) {
		return mapper.deleteComInfo(comInfoNo);
	}

	@Override
	public List<CompanyFile> selectComFiles(CompanyInfo comInfo) {
		return mapper.selectComFiles(comInfo);
	}

	@Override
	public CompanyFile selectComFile(CompanyInfo comInfo) {
		return mapper.selectComFile(comInfo);
	}

	@Override
	public int insertComFile(CompanyFile comFile) {
		return mapper.insertComFile(comFile);
	}

	@Override
	public int deleteComFile(int comInfoNo) {
		return mapper.deleteComFile(comInfoNo);
	}

	@Override
	public List<Tender> selectAuction(Page page) {
		return mapper.selectAuction(page);
	}

	@Override
	public int selectAuctionCnt(int comNo) {
		return mapper.selectAuctionCnt(comNo);
	}

	@Override
	public CompanyMember selectCompanyMember(int memNo) {
		return mapper.selectCompanyMember(memNo);
	}

	@Override
	public int updateMember(Member member) {
		return mapper.updateMember(member);
	}

	@Override
	public int updateCompanyMember(CompanyMember comMem) {
		return mapper.updateCompanyMember(comMem);
	}


}
