package kr.co.marryus.repository.mapper;


import java.util.List;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Reservation;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Studio;


public interface MycompanyMapper {
	
	//업체 서비스 등록
	public List<CompanyInfo> selectComInfoList(int memNo);
	public String[] selectComInfoType(int memNo);
	public CompanyInfo selectComInfoDetail(CompanyInfo comInfo);
	public int insertComInfo(CompanyInfo comInfo);
	public int updateComInfo(CompanyInfo comInfo);
	public int deleteComInfo(int comInfoNo);
	
	
	public List<CompanyFile> selectComFiles(CompanyInfo comInfo);
	public CompanyFile selectComFile(CompanyInfo comInfo);
	public int insertComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
	//입찰 현황보기(업체)
    public List<Tender> selectAuction(Page page);
    public int selectAuctionCnt(int comNo);

	//회원정보 수정(일반, 업체)
	public CompanyMember selectCompanyMember(int memNo);
	public int updateMember(Member member);
	public int updateCompanyMember(CompanyMember comMem);
	
	//예약 현황
	public List<Reservation> selectReservation(int memNo);
	
	//메인
	public Tender selectTenderCal(int memNo);
	public int selectCompanyLikeByComMem(int memNo);
	public int selectTenderchoose(int memNo);
	public int selectTenderDoing(int memNo);
	public int selectTenderDone(int memNo);

	
}
