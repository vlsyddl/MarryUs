package kr.co.marryus.wedservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.mapper.JewelryMapper;

@Service
public class JewelryServiceImpl implements JewelryService {

	@Autowired
	private JewelryMapper mapper;
	
	@Override
	public List<CompanyInfo> jewelryCompanyList(Page page) {
		return mapper.jewelryCompanyList(page);
	}

	@Override
	public int jewelryCompanyCount() {
		return mapper.auctionCount();
	}

	@Override
	public CompanyInfo comInfoDetail(int comInfoNo) {
		return mapper.comInfoDetail(comInfoNo);
	}

	@Override
	public List<CompanyFile> comInfoFiles(int comInfoNo) {
		return mapper.comInfoFiles(comInfoNo);
	}

	@Override
	public List<Auction> jewelryAuctionList(Page page) {
		return mapper.auctionList(page);
	}

	@Override
	public int jewelryAuctionCount() {
		return mapper.auctionCount();
	}

	@Override
	public Auction jewelryAuctionDetail(Auction auction) {
		return mapper.auctionDetail(auction);
	}

	@Override
	public void writeAuction(Auction auction) {
		mapper.insertAuction(auction);
	}

	@Override
	public void writeJewelry(Jewelry jewelry) {
		mapper.insertJewelryAuction(jewelry);
	}

	@Override
	public Auction auctionCheck(int auctionNo) {
		return mapper.selectAuctionCheck(auctionNo);
	}

	@Override
	public CompanyInfo comInfoCheck(CompanyInfo companyInfo) {
		return mapper.selectComInfoCheck(companyInfo);
	}

	@Override
	public void writeTender(Tender tender) {
		mapper.insertTender(tender);
	}

	@Override
	public Member loginCheck(CompanyInfo companyInfo) {
		return mapper.selectLoginCheck(companyInfo);
	}

}
