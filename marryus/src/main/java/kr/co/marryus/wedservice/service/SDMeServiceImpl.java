package kr.co.marryus.wedservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.mapper.SDMeMapper;

@Service
public class SDMeServiceImpl implements SDMeService{

	@Autowired
	private SDMeMapper mapper;

	@Override
	public List<CompanyInfo> sdmeCompanyList(Page page) {
		return mapper.SDMeCompanyList(page);
	}

	@Override
	public int sdmeCompanyCount() {
		return mapper.SDMeCompanyCount();
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
	public List<Auction> sdmeAuctionList(Page page) {
		return mapper.auctionList(page);
	}

	@Override
	public int sdmeAuctionCount() {
		return mapper.auctionCount();
	}

	@Override
	public Auction sdmeAuctionDetail(Auction auction) {
		return mapper.auctionDetail(auction);
	}

	@Override
	public void writeAuction(Auction auction) {
		mapper.insertAuction(auction);
	}

	@Override
	public void writeStudio(Studio studio) {
		mapper.insertStudioAuction(studio);
	}

	@Override
	public void writeDress(Dress dress) {
		mapper.insertDressAuction(dress);
	}

	@Override
	public void writeMakeup(Makeup makeup) {
		mapper.insertMakeupAuction(makeup);
	}
	
}
