package kr.co.marryus.wedservice.service;

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

public interface HoneymoonService {
	List<CompanyInfo> HoneymoonList(Page page);
	int selectHoneymoonCount();
	
	List<Auction> auctionList(Page page);
	int selectAuctionCount();
	
	
	//역경매 신청
	void HoneyinsertAuction(Auction auction);
	void honeymoonAuction(Honeymoon honeymoon);
	
	//검색
	List<CompanyInfo> searchHoneymoon(Search search);
	int selectHoneySearchCount(Search search);
	
	//역경매 디테일
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	
	//허니문 역경매 리스트 디테일
	Auction HoneyAuctionDetail(Auction auction);
	
	//입찰서 등록
	void insertTender(Tender tender);
	Auction selectAuctionDetail(int auctionNo);
	CompanyInfo selectCompanyDetail(int memNo);
	
	
	//검색
	List<CompanyInfo> selectWeddingSearch(Search search);
	
	Member loginCheck(CompanyInfo companyInfo);
	
	
	
	//추천업체
	int comLikeCheck(CompanyLike companyLike);
	void comLike(CompanyLike companyLike);
	void comLikeCancel(CompanyLike companyLike);
}
