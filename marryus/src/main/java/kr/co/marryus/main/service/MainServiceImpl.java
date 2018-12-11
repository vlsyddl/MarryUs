package kr.co.marryus.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.SearchForm;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;
import kr.co.marryus.repository.mapper.MainMapper;

/**
 * Main service Impl
 * @author suzie
 *
 */
@Service
public class MainServiceImpl implements MainService{
	/**
	 * main페이지 mapper
	 */
	@Autowired
	MainMapper mapper;
	
	/**
	 * 나만의 웨딩플랜 데이터 입력 
	 */
	@Override
	public void insertWedPlan(WeddingPlan weddingPlan) {
		mapper.insertWedPlan(weddingPlan);
	}
//
//	/**
//	 * 마감
//	 */
//	@Override
//	public List<Auction> selectDuedate(Auction auction) {
//		
//		return mapper.selectDuedate(auction);
//	}

	/**
	 * 역경매 리스트 불러오기 
	 */
	@Override
	public List<Auction> selectActionlist(Auction auction) {
		
		return mapper.selectActionlist(auction);
	}
	/**
	 * 역경매 List 2
	 */
	@Override
	public List<Auction> auctionList(Auction auction) {
		
		return mapper.auctionList(auction);
	}
	
	/**
	 * 나만의 웨딩플랜 
	 */
	@Override
	public void sortingPlan(Todo todo) {
		mapper.sortingPlan(todo);
	}
	
	/**
	 * 나만의 웨딩플랜 체크리스트 
	 */
	@Override
	public List<Todo> selectTodoListByWP(Todo todo) {
		
		return mapper.selectTodoListByWP(todo);
	}
	
	/**
	 * 마감 임박 역경매 건 가져오기 D-7일부터 
	 */
	@Override
	public List<Auction> selectAuctionEDate(Auction auction) {
		
		return mapper.selectAuctionEDate(auction);
	}

	/**
	 * profile - TodoList 총 개수
	 */
	@Override
	public int countTotalTODO(int memNo) {
		return mapper.countTotalTODO(memNo);
	}
	/**
	 * profile - TodoList Done 개수 
	 */
	@Override
	public int countTODOdone(int memNo) {
		return mapper.countTODOdone(memNo);
	}
	
	/**
	 * profile - 총 auction건 수
	 */
	@Override
	public int countTotalAuction(int memNo) {
		return mapper.countTotalAuction(memNo);
	}
	
	/**
	 * profile - auction 끝난 건 수
	 */
	@Override
	public int countAuctiondone(int memNo) {
		return mapper.countAuctiondone(memNo);
	}

	/**
	 * profile - wedding date
	 */
	@Override
	public String getWedDate(int memNo) {
		
		return mapper.getWedDate(memNo);
	}

	/**
	 * profile - 북마크 업체 수
	 */
	@Override
	public int countCompanyLike(int memNo) {
		
		return mapper.countCompanyLike(memNo);
	}

	/**
	 *  profile - 총 예산
	 */
	@Override
	public int totalBudget(int memNo) {
		return mapper.totalBudget(memNo);
	}
	/**
	 *  profile - 지출 예산
	 */
	@Override
	public int spendBudget(int memNo) {
		return mapper.spendBudget(memNo);
	}

	@Override
	public List<Auction> auctionListSDM(Auction auction) {
		
		return mapper.auctionListSDM(auction);
	}

	@Override
	public List<Board> reviewList(SearchForm form) {
		
		return mapper.reviewList(form);
	}

	
}
