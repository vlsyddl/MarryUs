package kr.co.marryus.mypage.service;


import java.util.List;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.repository.domain.Auction;

public interface MypageService {

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
	public int updateComFile(CompanyFile comFile);
	public int deleteComFile(int comInfoNo);
	
	//입찰 현황보기(업체)
    public List<Tender> selectAuction(Page page);
    public int selectAuctionCnt(int comNo);

	//회원정보 수정(일반, 업체)
	public GeneralMember selectGeneralMember(int memNo);
	public CompanyMember selectCompanyMember(int memNo);
	public int updateMember(Member member);
	public int updateGeneralMember(GeneralMember genMem);
	public int updateCompanyMember(CompanyMember comMem);
	
	//관심업체
	public List<CompanyInfo>  selectCompanyLike (int momNo);
	public int deleteCompanyLike(CompanyLike comLike);
	public int selectCompanyLikeCnt(int memNo);
	
	//경매 현황보기(일반회원)
	public List<Auction> selectGeneralAuction(Auction auction);
	public int selectGeneralAuctionCnt(Auction auction);
	
	//역경매 신청서 수정
	public Venue selectVenue(Auction auction);
	public Studio selectStudio(Auction auction);
	public Dress selectDress(Auction auction);
	public Makeup selectMakeup(Auction auction);
	public Jewelry selectHoneymoon(Auction auction);
	public ServiceAdd selectJewelry(Auction auction);
	
	public int updateVenue(Venue venue);
	public int updateStudio(Studio studio);
	public int updateDress(Dress dress);
	public int updateMakeup(Makeup makeup);
	public int updateJewelry(Jewelry jewelry);
	public int updateServiceAdd(ServiceAdd serviceAdd);
	
	//투두
	public List<Todolist> selectTodoSortByDate(int memNo);
	public List<Todolist> selectTodoSortByCategory(int memNo);
	public int insertTodo(Todo todo);
	public int updateTodo(Todo todo);	
	public int deleteTodo(int todoNo);

	
}
