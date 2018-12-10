package kr.co.marryus.main.service;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;

/**
 * Main service
 * @author suzie
 *
 */
public interface MainService {
//	/**
//	 * 마감기한 
//	 * @param auction
//	 * @return
//	 */
//	List<Auction> selectDuedate(Auction auction);
	/**
	 * 나만의 웨딩 플랜
	 * @param weddingPlan
	 */
	void insertWedPlan(WeddingPlan weddingPlan);
	
	/**
	 * 역경매 리스트 불러오기 
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
	 * TodoList 총갯수 
	 * @param memNo
	 * @return
	 */
	int countTotalTODO(int memNo);
	
	/**
	 * TodoList done 갯수
	 * @param memNo
	 * @return
	 */
	int countTODOdone(int memNo);
}
