package kr.co.marryus.wedservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.repository.mapper.WeddingHallMapper;
@Service
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingHallMapper mapper;
	// 웨딩업체리스트
	@Override
	public List<CompanyInfo> WeddingList(Page page) {
		return mapper.weddingList(page);
	}

	@Override
	public int selectWeddingCount() {
		return mapper.selectWeddingCount();
	}
	//역경매 리스트
	@Override
	public List<Auction> auctionList(Page page) {
		return mapper.auctionList(page);
	}

	@Override
	public int selectAuctionCount() {
		return mapper.selectAuctionCount();
	}
	//역경매 신청
	@Override
	public void insertAuction(Auction auction) {
		mapper.insertAuction(auction);
		
	}
	@Override
	public void weddingWrite(Venue venue) {
		mapper.weddingAuction(venue);
	}

	@Override
	public List<CompanyFile> selectComFiles(CompanyInfo companyInfo) {
		return mapper.selectComFiles(companyInfo);
	}

	@Override
	public CompanyInfo comInfoDetail(int comInfoNo) {
		// TODO Auto-generated method stub
		return mapper.comInfoDetail(comInfoNo);
	}

	@Override
	public List<CompanyFile> comInfoFiles(int comInfoNo) {
		// TODO Auto-generated method stub
		return mapper.comInfoFiles(comInfoNo);
	}

	//웨딩홀 역경매 리스트 디테일
	@Override
	public Venue WeddingAuctionDetail(int auctionNo) {
		return mapper.WeddingAuctionDetail(auctionNo);
	}
	
	//입찰서 등록
	@Override
	public void insertTender(Tender tender) {
		mapper.insertTender(tender);
		
	}

	@Override
	public Auction selectAuctionDetail(int auctionNo) {
		return mapper.selectAuctionDetail(auctionNo);
	}

	@Override
	public CompanyInfo selectCompanyDetail(int memNo) {
		return mapper.selectCominfo(memNo);
	}


//	@Override
//	public CompanyInfo weddingDetail(int comInfoNo) {
//		return mapper.weddingDetail(comInfoNo);
//	}

	
	
	
	
	
	
}
