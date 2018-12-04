package kr.co.marryus.repository.mapper;


import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Page;


public interface MypageMapper {
	public List<CompanyInfo> selectComInfoList(int memNo);
	public CompanyInfo selectComInfoDetail(CompanyInfo comInfo);
	public int insertComInfo(CompanyInfo comInfo);
	public int updateComInfo(CompanyInfo comInfo);
	public int deleteComInfo(int comInfoNo);
	
	public List<CompanyFile> selectComFiles(CompanyInfo comInfo);
	public CompanyFile selectComFile(CompanyInfo comInfo);
	public int insertComFile(CompanyFile comFile);
	public int updateComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
    public List<Tender> selectAuction(Page page);
    public int selectAuctionCnt(int comNo);

	
	public GeneralMember selectGeneralMember(int memNo);
	public CompanyMember selectCompanyMember(int memNo);
	public int updateMember(Member member);
	public int updateGeneralMember(GeneralMember genMem);
	public int updateCompanyMember(CompanyMember comMem);
	
	public List<CompanyInfo> selectCompanyLike (int momNo);
	public int deleteCompanyLike(CompanyLike comLike);
	public int selectCompanyLikeCnt(int memNo);
	
	public List<CompanyInfo> selectGeneralAuction(Auction auction);
	public int selectGeneralAuctionCnt(Auction auction);
	
	
}
