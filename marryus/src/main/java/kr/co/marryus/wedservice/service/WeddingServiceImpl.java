package kr.co.marryus.wedservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.mapper.WeddingHallMapper;
@Service
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingHallMapper mapper;
	
	@Override
	public List<CompanyInfo> WeddingList(Page page) {
		return mapper.weddingList(page);
	}

	@Override
	public int selectWeddingCount() {
		return mapper.selectWeddingCount();
	}
	
	
	
	
	
}
