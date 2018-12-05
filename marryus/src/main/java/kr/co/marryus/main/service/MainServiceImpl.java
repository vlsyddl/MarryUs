package kr.co.marryus.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
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

	@Override
	public List<Auction> auctionList(Auction auction) {
		
		return mapper.auctionList(auction);
	}

	@Override
	public void sortingPlan(Todo todo) {
		mapper.sortingPlan(todo);
	}
}
