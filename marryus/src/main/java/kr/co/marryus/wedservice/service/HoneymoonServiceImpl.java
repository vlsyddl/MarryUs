package kr.co.marryus.wedservice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.mapper.HoneymoonMapper;

@Service
public class HoneymoonServiceImpl implements HoneymoonService{
	@Autowired
	private HoneymoonMapper mapper;

	@Override
	public List<CompanyInfo> HoneymoonList(Page page) {
		return mapper.honeymoonList(page);
	}

	@Override
	public int selectHoneymoonCount() {
		return mapper.selectHoneymoonCount();
	}

	@Override
	public List<Auction> auctionList(Page page) {
		return mapper.auctionList(page);
	}

	@Override
	public int selectAuctionCount() {
		return mapper.selectAuctionCount();
	}

	@Override
	public void HoneyinsertAuction(Auction auction) {
		mapper.HoneyinsertAuction(auction);
	}
	@Override
	public void honeymoonAuction(Honeymoon honeymoon) {
		mapper.honeymoonAuction(honeymoon);
	}

	@Override
	public List<CompanyInfo> searchHoneymoon(Search search) {
		return mapper.searchHoneymoon(search);
	}

	@Override
	public int selectHoneySearchCount(Search search) {
		return mapper.selectHoneySearchCnt(search);
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

	@Override
	public Auction HoneyAuctionDetail(Auction auction) {
		return mapper.HoneyAuctionDetail(auction);
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
	
	@Override
	public List<CompanyInfo> selectWeddingSearch(Search search) {
		return mapper.selectWeddingSearch(search);
	}


	@Override
	public Member loginCheck(CompanyInfo companyInfo) {
		return mapper.selectLoginCheck(companyInfo);
	}
	
	@Override
	public int comLikeCheck(CompanyLike companyLike) {
		return mapper.selectCompanyLike(companyLike);
	}

	@Override
	public void comLike(CompanyLike companyLike) {
		mapper.insertCompanyLike(companyLike);
	}

	@Override
	public void comLikeCancel(CompanyLike companyLike) {
		mapper.deleteCompanyLike(companyLike);
	}


}
