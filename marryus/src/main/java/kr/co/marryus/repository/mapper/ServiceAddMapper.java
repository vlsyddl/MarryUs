package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Tender;

public interface ServiceAddMapper {
	
	List<CompanyInfo> AddCompanyList(Page page);
	int AddCompanyCount();
	
	CompanyInfo comInfoDetail(int comInfoNo);
	List<CompanyFile> comInfoFiles(int comInfoNo);
	
	List<Auction> addauctionList(Page page);
	int addauctionCount();
	
	
	void addinsertAuction(Auction auction);
	void insertServiceAddAuction(ServiceAdd serviceAdd);
	
	ServiceAdd addauctionDetail(int auctionNo);
	
	void insertTender(Tender tender);
	Auction selectAuctionDetail(int auctionNo);
	CompanyInfo selectCominfo(int memNo);
	
	
	//검색
	List<CompanyInfo> selectWeddingSearch(Search search);
	Member selectLoginCheck(CompanyInfo companyInfo);
	
	//추천업체
	int selectCompanyLike(CompanyLike companyLike);
	void insertCompanyLike(CompanyLike companyLike);
	void deleteCompanyLike(CompanyLike companyLike);
}
