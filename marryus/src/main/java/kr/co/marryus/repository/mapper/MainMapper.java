package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.WeddingPlan;
/**
 * Main 페이지와 관련된 mapper
 * @author suzie
 *
 */
public interface MainMapper {
	// 나만의 웨딩 플랜 데이터 입력 
	void insertWedPlan(WeddingPlan weddingPlan);
	
	//역경매 리스트 
	List<Auction> selectActionlist(Auction auction);


}
