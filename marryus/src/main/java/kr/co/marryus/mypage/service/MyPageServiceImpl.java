package kr.co.marryus.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.mapper.MypageMapper;

@Service
public class MyPageServiceImpl implements MypageService{
	@Autowired
	MypageMapper mapper;
	
	
	@Override
	public List<Auction> selectAuction(int memNo) {
		return mapper.selectAuction(memNo);
	}

}
