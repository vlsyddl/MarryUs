package kr.co.marryus.repository.mapper;


import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Tender;

public interface MypageMapper {
	
	public int insertComInfo(CompanyInfo comInfo);
	public int updateComInfo(CompanyInfo comInfo);
	public int deleteComInfo(int comInfoNo);
	
	public int insertComFile(CompanyFile comFile);
	public int updateComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
	public List<Auction> selectAuction(int memNo);
	
	public GeneralMember selectGeneralMember(int memNo);
	public CompanyMember selectCompanyMember(int memNo);
	
}
