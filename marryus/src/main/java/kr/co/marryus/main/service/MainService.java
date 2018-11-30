package kr.co.marryus.main.service;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
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
}
