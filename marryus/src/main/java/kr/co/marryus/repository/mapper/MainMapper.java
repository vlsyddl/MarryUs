package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;
/**
 * Main 페이지와 관련된 mapper
 * @author suzie
 *
 */
public interface MainMapper {
	// 나만의 웨딩 플랜 데이터 입력 
	void insertWedPlan(WeddingPlan weddingPlan);
	
	//역경매 리스트 안씀
	List<Auction> selectActionlist(Auction auction);
	
	//역경매 리스트 
	List<Auction> auctionList(Auction auction);
	
	//역경매 리스트  sdm
	List<Auction> auctionListSDM(Auction auction);
	
	// 나만의 웨딩 
	void sortingPlan(Todo todo);
	
	// 나만의 웨딩플랜 sorting
	List<Todo> selectTodoListByWP(Todo todo);
	
	// 마감임박 경매 건 가져오기  - 7일 
	List<Auction> selectAuctionEDate(Auction auction);
	
	//profile - TodoList 총 개수
	int countTotalTODO(int memNo);
	
	//profile - TodoList Done 개수
	int countTODOdone(int memNo);
	
	//profile - 총 auction건 수 
	int countTotalAuction(int memNo);
	
	//profile - auction 끝난 건 수 
	int countAuctiondone(int memNo);
	
	// profile - wedding date 가져오기 
	String getWedDate(int memNo);
	
	//profile - 북마크 업체가져오기 
	int countCompanyLike(int memNo);
	
	//profile - 총예산
	int totalBudget(int memNo);
	
	//profile - 지출한 예산
	int spendBudget(int memNo);
	
	// 리뷰
	List<Board> mainReviewList(String cateory);
	
	// 업체 추천
	List<CompanyInfo> selectCompanyRecommned();
	
	//total Auction List
	List<Auction> totalAuctionList();
	
	//count d day
	List<Integer> countDday();
	
	// 추천업체 웨딩홀
	List<CompanyInfo> recVenue();
	
	// 추천업체 스드메
	List<CompanyInfo> recSDM();
	
	// 추천업체 허니문
	List<CompanyInfo> recHoney();
	
	// 추천업체 예물
	List<CompanyInfo> recJewelry();
	
	// 추천업체 추가서비스
	List<CompanyInfo> recEvent();
	
	// 업데이트 
	void updateWedPlan(WeddingPlan weddingPlan);
	
	// wedding plan 확인용 
	int myWedingPlan(int memNo);
}
