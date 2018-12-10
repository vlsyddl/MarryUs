package kr.co.marryus.wedservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.mapper.ServiceAddMapper;
@Service
public class ServiceAddServiceImpl implements ServiceAddService{
	
	@Autowired
	private ServiceAddMapper mapper; 

	@Override
	public List<CompanyInfo> AddCompanyList(Page page) {
		return mapper.AddCompanyList(page);
	}

	@Override
	public int AddCompanyCount() {
		return mapper.AddCompanyCount();
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
	public List<Auction> addauctionList(Page page) {
		return mapper.addauctionList(page);
	}

	@Override
	public int addauctionCount() {
		return mapper.addauctionCount();
	}

	@Override
	public void addinsertAuction(Auction auction) {
		mapper.addinsertAuction(auction);
		
	}

	@Override
	public void insertServiceAddAuction(ServiceAdd serviceAdd) {
		mapper.insertServiceAddAuction(serviceAdd);
		
	}

	@Override
	public ServiceAdd addauctionDetail(int auctionNo) {
		return mapper.addauctionDetail(auctionNo);
	}

	@Override
	public void insertTender(Tender tender) {
		mapper.insertTender(tender);
		
	}

	@Override
	public Auction selectAuctionDetail(int auctionNo) {
		return mapper.selectAuctionDetail(auctionNo);
	}

	@Override
	public CompanyInfo selectCominfo(int memNo) {
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

}
