package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;

public interface WeddingHallMapper {
	
	List<CompanyInfo> weddingList(Page page);
	List<CompanyFile> selectComFiles(CompanyInfo companyInfo);
//	CompanyInfo weddingDetail(int comInfoNo);
	int selectWeddingCount();
	
	// 역경매 리스트
	List<Auction> auctionList(Page page);
	int selectAuctionCount();
	
	//역경매신청
	void insertAuction(Auction auction);
	void weddingAuction(Venue venue);
	
	//역경매 디테일
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	
	Venue WeddingAuctionDetail(int auctionNo);
	
	//입찰서 등록
	void insertTender(Tender tender);
	Auction selectAuctionDetail(int auctionNo);
	CompanyInfo selectCominfo(int memNo);
	
	//검색
	List<CompanyInfo> selectWeddingSearch(Search search);
	int selectWeddingSearchCount(Search search);
	
	Member selectLoginCheck(CompanyInfo companyInfo);
	
	
}
