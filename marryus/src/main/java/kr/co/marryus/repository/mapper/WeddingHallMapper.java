package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;

public interface WeddingHallMapper {
	
	List<CompanyInfo> weddingList(Page page);
	int selectWeddingCount();
	
	
	
}
