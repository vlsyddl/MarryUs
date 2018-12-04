package kr.co.marryus.repository.mapper;

import java.util.List;

import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;

public interface HoneymoonMapper {
	
	List<CompanyInfo> honeymoonList(Page page);
	int selectHoneymoonCount();
}
