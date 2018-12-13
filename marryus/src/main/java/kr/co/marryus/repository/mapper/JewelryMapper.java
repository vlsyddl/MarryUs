package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.Tender;

public interface JewelryMapper {
	List<CompanyInfo> jewelryCompanyList(Page page);
	int jewelryCompanyCount();
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	List<Auction> auctionList(Page page);
	int auctionCount();
	Auction auctionDetail(Auction auction);
	void insertAuction(Auction auction);
	void insertJewelryAuction(Jewelry jewelry);
	Auction selectAuctionCheck(int auctionNo);
	CompanyInfo selectComInfoCheck(CompanyInfo companyInfo);
	void insertTender(Tender tender);
	Member selectLoginCheck(CompanyInfo companyInfo);
	int selectCompanyLike(CompanyLike companyLike);
	void insertCompanyLike(CompanyLike companyLike);
	void deleteCompanyLike(CompanyLike companyLike);
	
	List<CompanyInfo> selectJewelrySearch(Search search);
}
