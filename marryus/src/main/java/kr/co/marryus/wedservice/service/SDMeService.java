package kr.co.marryus.wedservice.service;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;

public interface SDMeService {
	List<CompanyInfo> sdmeCompanyList(Page page);
	int sdmeCompanyCount();
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	List<Auction> sdmeAuctionList(Page page);
	int sdmeAuctionCount();
	Auction sdmeAuctionDetail(Auction auction);
	void writeAuction(Auction auction);
	void writeStudio(Studio studio);
	void writeDress(Dress dress);
	void writeMakeup(Makeup makeup);
	Auction auctionCheck(int auctionNo);
	CompanyInfo comInfoCheck(CompanyInfo companyInfo);
	void writeTender(Tender tender);
	Member loginCheck(CompanyInfo companyInfo);
	int comLikeCheck(CompanyLike companyLike);
	void comLike(CompanyLike companyLike);
	void comLikeCancel(CompanyLike companyLike);
}
