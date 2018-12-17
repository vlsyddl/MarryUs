package kr.co.marryus.repository.mapper;


import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Budget;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Reservation;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Studio;


public interface MypageMapper {
	//업체 서비스 등록
	public List<CompanyInfo> selectComInfoList(int memNo);
	public String[] selectComInfoType(int memNo);
	public CompanyInfo selectComInfoDetail(CompanyInfo comInfo);
	public int insertComInfo(CompanyInfo comInfo);
	public int updateComInfo(CompanyInfo comInfo);
	public int deleteComInfo(int comInfoNo);
	
	
	public List<CompanyFile> selectComFiles(CompanyInfo comInfo);
	public CompanyFile selectComFile(CompanyInfo comInfo);
	public int insertComFile(CompanyFile comFile);
	public int updateComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
	//입찰 현황보기(업체)
    public List<Tender> selectAuction(Page page);
    public int selectAuctionCnt(int comNo);
    
    //개인 예약 보기
    List<Reservation> selectReservation(int memNo);

	//회원정보 수정(일반, 업체)
	public GeneralMember selectGeneralMember(int memNo);
	public CompanyMember selectCompanyMember(int memNo);
	public int updateMember(Member member);
	public int updateGeneralMember(GeneralMember genMem);
	public int updateCompanyMember(CompanyMember comMem);
	
	
	//업체 예약하기
	public int insertReservation(Reservation res);
	
	//관심업체
	public List<CompanyInfo>  selectCompanyLike (int momNo);
	public int deleteCompanyLike(CompanyLike comLike);
	public int selectCompanyLikeCnt(int memNo);
	
	//경매 현황보기(일반회원)
	public List<Auction> selectGeneralAuction(Auction auction);
	public int selectGeneralAuctionCnt(Auction auction);
	
	//역경매 신청서 수정
	public Venue selectVenue(int auctionNo);
	public Studio selectStudio(int auctionNo);
	public Dress selectDress(int auctionNo);
	public Makeup selectMakeup(int auctionNo);
	public Honeymoon selectHoneymoon(int auctionNo);
	public Jewelry selectJewelry(int auctionNo);
	public ServiceAdd selectServiceAdd(int auctionNo);
	
	public int updateVenue(Venue venue);
	public int updateStudio(Studio studio);
	public int updateDress(Dress dress);
	public int updateMakeup(Makeup makeup);
	public int updateJewelry(Jewelry jewelry);
	public int selectServiceAdd(ServiceAdd serviceAdd);
	
	//투두
	public List<Todolist> selectTodoSortByDate(int memNo);
	public List<Todolist> selectTodoSortByCategory(int memNo);
	public int insertTodo(Todo todo);
	public int updateTodo(Todo todo);	
	public int deleteTodo(int todoNo);
	
	//내 예산
	List<Budget> selectBudget(int memNo);
	void insertBudget(Budget budget);
	void updateBudget(Budget budget);
	void deleteBudget(int budgNo);
	
	  //메인(개인)
	   String getWedDate(int memNo);
	   int MycountTotalTODO(int memNo);
	   int MycountTODOdone(int memNo);
	   int MycountTotalAuction(int memNo);
	   int MycountAuctiondone(int memNo);
	   int MycountCompanyLike(int memNo);
	   int MytotalBudget(int memNo);
	   //int MytotalBudget(int memNo);
	   int MyspendBudget(int memNo);
	   List<Todo> selectTodoThree(int memNo);
	   int selectByTenderCnt(Auction auction);


	   


}
