package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;

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
}
