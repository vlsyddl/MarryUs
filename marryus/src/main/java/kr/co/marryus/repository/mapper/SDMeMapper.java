package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;

public interface SDMeMapper {
	List<CompanyInfo> sdmeCompanyList(Page page);
	int sdmeCompanyCount();
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	List<Auction> auctionList(Page page);
	int auctionCount();
	Auction auctionDetail(Auction auction);
	void insertAuction(Auction auction);
	void insertStudioAuction(Studio studio);
	void insertDressAuction(Dress dress);
	void insertMakeupAuction(Makeup makeup);
	Auction selectAuctionCheck(int auctionNo);
	CompanyInfo selectComInfoCheck(CompanyInfo companyInfo);
	void insertTender(Tender tender);
	Member selectLoginCheck(CompanyInfo companyInfo);
}
