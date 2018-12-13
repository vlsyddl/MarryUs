package kr.co.marryus.wedservice.service;

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

public interface JewelryService {
	List<CompanyInfo> jewelryCompanyList(Page page);
	int jewelryCompanyCount();
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	List<Auction> jewelryAuctionList(Page page);
	int jewelryAuctionCount();
	Auction jewelryAuctionDetail(Auction auction);
	void writeAuction(Auction auction);
	void writeJewelry(Jewelry jewelry);
	Auction auctionCheck(int auctionNo);
	CompanyInfo comInfoCheck(CompanyInfo companyInfo);
	void writeTender(Tender tender);
	Member loginCheck(CompanyInfo companyInfo);
	int comLikeCheck(CompanyLike companyLike);
	void comLike(CompanyLike companyLike);
	void comLikeCancel(CompanyLike companyLike);
	
	List<CompanyInfo> selectJewelrySearch(Search search);
}
