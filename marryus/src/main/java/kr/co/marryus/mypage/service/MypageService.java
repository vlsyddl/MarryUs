package kr.co.marryus.mypage.service;


import java.util.List;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Tender;


import kr.co.marryus.repository.domain.Auction;

public interface MypageService {

	public List<CompanyInfo> selectComInfoList(int memNo);
	public List<CompanyInfo> selectComInfoDetail(int comInfoNo);
	public int insertComInfo(CompanyInfo comInfo);
	public int updateComInfo(CompanyInfo comInfo);
	public int deleteComInfo(int comInfoNo);
	

	public int insertComFile(CompanyFile comFile);
	public int updateComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
    public List<Tender> selectAuction(Page page);
    public int selectAuctionCnt(int comNo);

	
	public GeneralMember selectGeneralMember(int memNo);
	public CompanyMember selectCompanyMember(int memNo);
	
	public CompanyInfo selectGeneralAuction(Auction auction);

	
}
