package kr.co.marryus.wedservice.service;

import java.util.List;

import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;

public interface WeddingService {
	
	List<CompanyInfo> WeddingList(Page page);
	int selectWeddingCount();
}
