package kr.co.marryus.main.service;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.SearchForm;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;

/**
 * Main service
 * @author suzie
 *
 */
public interface MainService {

	/**
	 * 나만의 웨딩 플랜
	 * @param weddingPlan
	 */
	void insertWedPlan(WeddingPlan weddingPlan);
	
	/**
	 * 역경매 리스트 불러오기 x
	 * @param auction
	 * @return
	 */
	List<Auction> selectActionlist(Auction auction);
	
	/**
	 *역경매 리스트 불러오기 2 
	 * @param auction
	 * @return
	 */
	List<Auction> auctionList(Auction auction);
	
	/**
	 * 역경매 리스트 불러오기 2-sdm
	 * @param auction
	 * @return
	 */
	List<Auction> auctionListSDM(Auction auction);
	
	/**
	 * 나만의 웨딩플랜
	 * @param todo
	 */
	void sortingPlan(Todo todo);
	
	/**
	 * 나만의 웨딩플랜 결과 
	 * @param todo
	 * @return
	 */
	List<Todo> selectTodoListByWP(Todo todo);
	
	/**
	 * 마감임박 역경매 건 리스트  (D-7)
	 * @param auction
	 * @return
	 */
	List<Auction> selectAuctionEDate(Auction auction);
	
	/**
	 * profile - TodoList 총 개수  
	 * @param memNo
	 * @return
	 */
	int countTotalTODO(int memNo);
	
	/**
	 * profile - TodoList Done 개수
	 * @param memNo
	 * @return
	 */
	int countTODOdone(int memNo);
	
	/**
	 * profile - 총 auction건 수 
	 * @param memNo
	 * @return
	 */
	int countTotalAuction(int memNo);
	
	/**
	 * profile - auction 끝난 건 수 
	 * @param memNo
	 * @return
	 */
	int countAuctiondone(int memNo);
	
	/**
	 * profile - wedding date
	 * @param memNo
	 * @return
	 */
	String getWedDate(int memNo);
	
	/**
	 * profile - 관심 업체 수
	 * @param memNo
	 * @return
	 */
	int countCompanyLike(int memNo);
	
	/**
	 * profile - 총 예산
	 * @param memNo
	 * @return
	 */
	int totalBudget(int memNo);
	
	/**
	 * profile - 지출한 예산
	 * @param memNo
	 * @return
	 */
	int spendBudget(int memNo);

	/**
	 * 리뷰 리스트 
	 * @param form
	 * @return
	 */
	List<Board> mainReviewList(String cateory);
	
	/**
	 * 추천 업체 limit 5 개 , (추천 기준..?)
	 * @param type
	 * @return
	 */
	List<CompanyInfo> selectCompanyRecommned();
	
	/**
	 * total auction List
	 * @return
	 */
	List<Auction> totalAuctionList();
	
	
	
	
	/**
	 * count d day
	 * @return
	 */
	List<Integer> countDday();

	/**
	 * 추천업체 -웨딩홀
	 * @return
	 */
	List<CompanyInfo> recVenue();
	
	/**
	 * 추천업체- 스튜디오, 드레스, 메이크업
	 * @return
	 */
	List<CompanyInfo> recSDM();
	
	/**
	 * 추천업체- 허니문
	 * @return
	 */
	List<CompanyInfo> recHoney();
	
	/**
	 * 추천업체 - 예물
	 * @return
	 */
	List<CompanyInfo> recJewelry();
	
	/**
	 * 추천업체 - 추가 이벤트 
	 * @return
	 */
	List<CompanyInfo> recEvent();
	
	/**
	 * wedding plan- 업데이트 
	 * @param weddingPlan
	 */
	void updateWedPlan(WeddingPlan weddingPlan);
	
	/**
	 * wedding plan - 했는지 않했는지 여부 
	 * @param memNo
	 * @return
	 */
	int myWedingPlan(int memNo);
	
}
