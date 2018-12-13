package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.Tender;

public interface HoneymoonMapper {
	
	List<CompanyInfo> honeymoonList(Page page);
	int selectHoneymoonCount();
	
	List<Auction> auctionList(Page page);
	int selectAuctionCount();
	
	void HoneyinsertAuction(Auction auction);
	void honeymoonAuction(Honeymoon honeymoon);
	
	// 검색
	List<CompanyInfo> searchHoneymoon(Search search);
	int selectHoneySearchCnt(Search search);
	
	
	//역경매 업체 디테일
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	
	// 허니문 역경매 리스트 디테일
	Honeymoon HoneyAuctionDetail(int auctionNo);
	
	
	void insertTender(Tender tender);
	Auction selectAuctionDetail(int auctionNo);
	CompanyInfo selectCominfo(int memNo);
	
	
	//검색
	List<CompanyInfo> selectWeddingSearch(Search search);
	Member selectLoginCheck(CompanyInfo companyInfo);
	
	
	
	//추천업체
	int selectCompanyLike(CompanyLike companyLike);
	void insertCompanyLike(CompanyLike companyLike);
	void deleteCompanyLike(CompanyLike companyLike);
	
}
