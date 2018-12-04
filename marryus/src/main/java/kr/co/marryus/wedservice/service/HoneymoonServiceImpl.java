package kr.co.marryus.wedservice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
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

}
