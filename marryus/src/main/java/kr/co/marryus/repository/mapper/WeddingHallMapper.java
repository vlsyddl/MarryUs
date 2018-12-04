package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
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
	
	
}
