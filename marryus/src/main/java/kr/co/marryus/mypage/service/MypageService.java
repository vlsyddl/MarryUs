package kr.co.marryus.mypage.service;


import java.util.List;

import kr.co.marryus.repository.domain.Auction;

public interface MypageService {

	public List<Auction> selectAuction(int memNo);
	
}
