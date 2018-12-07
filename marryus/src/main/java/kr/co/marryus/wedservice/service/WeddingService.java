package kr.co.marryus.wedservice.service;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;

public interface WeddingService {
	//웨딩업체리스트
	List<CompanyInfo> WeddingList(Page page);
    List<CompanyFile> selectComFiles(CompanyInfo companyInfo);
//    CompanyInfo weddingDetail(int comInfoNo);
	int selectWeddingCount();
	// 역경매리스트
	List<Auction> auctionList(Page page);
	int selectAuctionCount();
	//역경매 신청
	void weddingWrite(Venue venue);
	void insertAuction(Auction auction);
	//역경매 디테일
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	
	Venue WeddingAuctionDetail(int auctionNo);
	
	//입찰서 등록
	void insertTender(Tender tender);
	Auction selectAuctionDetail(int auctionNo);
	CompanyInfo selectCompanyDetail(int memNo);
}
