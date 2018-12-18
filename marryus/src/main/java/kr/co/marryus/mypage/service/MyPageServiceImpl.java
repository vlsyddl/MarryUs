package kr.co.marryus.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Budget;
import kr.co.marryus.repository.mapper.MypageMapper;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Reservation;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;
import kr.co.marryus.repository.domain.Venue;


@Service
public class MyPageServiceImpl implements MypageService{
	@Autowired
	MypageMapper mapper;
	
	
	@Override
    public List<Tender> selectAuction(Page page) {
        return mapper.selectAuction(page);
    }


    @Override
    public int selectAuctionCnt(int comNo) {
        return mapper.selectAuctionCnt(comNo);
    }


    @Override
    public int insertComInfo(CompanyInfo comInfo) {
        return mapper.insertComInfo(comInfo);
    }


    @Override
    public int updateComInfo(CompanyInfo comInfo) {
        return mapper.updateComInfo(comInfo);
    }


    @Override
    public int deleteComInfo(int comInfoNo) {
        return mapper.deleteComInfo(comInfoNo);
    }


    @Override
    public int insertComFile(CompanyFile comFile) {
        return mapper.insertComFile(comFile);
    }


    @Override
    public int updateComFile(CompanyFile comFile) {
        // TODO Auto-generated method stub
        return mapper.updateComFile(comFile);
    }


    @Override
    public int deleteComFile(int comInfoNo) {
        return mapper.deleteComFile(comInfoNo);
    }


    @Override
    public GeneralMember selectGeneralMember(int memNo) {
        return mapper.selectGeneralMember(memNo);
    }


    @Override
    public CompanyMember selectCompanyMember(int memNo) {
        return mapper.selectCompanyMember(memNo);
       
    }


	@Override
	public List<CompanyInfo> selectComInfoList(int memNo){
		return mapper.selectComInfoList(memNo);
	}
	
	@Override	
	public CompanyInfo selectComInfoDetail(CompanyInfo comInfo){
		return mapper.selectComInfoDetail(comInfo);
	}





	@Override
	public List<Auction> selectGeneralAuction(Auction auction) {
		return mapper.selectGeneralAuction(auction);
	}


	@Override
	public List<CompanyFile> selectComFiles(CompanyInfo comInfo) {
		return mapper.selectComFiles(comInfo);
	}


	@Override
	public CompanyFile selectComFile(CompanyInfo comInfo) {
		return mapper.selectComFile(comInfo);
	}


	@Override
	public int updateMember(Member member) {
		return mapper.updateMember(member);
	}


	@Override
	public int updateGeneralMember(GeneralMember genMem) {
		return mapper.updateGeneralMember(genMem);
	}


	@Override
	public int updateCompanyMember(CompanyMember comMem) {
		return mapper.updateCompanyMember(comMem);
	}


	@Override
	public List<CompanyInfo> selectCompanyLike(int momNo) {
		return mapper.selectCompanyLike(momNo);
	}


	@Override
	public int deleteCompanyLike(CompanyLike comLike) {
		return mapper.deleteCompanyLike(comLike);
	}


	@Override
	public int selectGeneralAuctionCnt(Auction auction) {
		return mapper.selectGeneralAuctionCnt(auction);
	}


	@Override
	public int selectCompanyLikeCnt(int memNo) {
		return mapper.selectCompanyLikeCnt(memNo);
	}


	@Override
	public Venue selectVenue(int auctionNo) {
		return mapper.selectVenue(auctionNo);
	}


	@Override
	public Studio selectStudio(int auctionNo) {
		return mapper.selectStudio(auctionNo);
	}


	@Override
	public Dress selectDress(int auctionNo) {
		return mapper.selectDress(auctionNo);
	}


	@Override
	public Makeup selectMakeup(int auctionNo) {
		return mapper.selectMakeup(auctionNo);
	}



	
	

	@Override
	public List<Todolist> selectTodoSortByDate(int memNo) {
		return mapper.selectTodoSortByDate(memNo);
	}


	@Override
	public int insertTodo(Todo todo) {
		return mapper.insertTodo(todo);
	}


	@Override
	public int updateTodo(Todo todo) {
		return mapper.updateTodo(todo);
	}


	@Override
	public List<Todolist> selectTodoSortByCategory(int memNo) {
		return mapper.selectTodoSortByCategory(memNo);
	}


	@Override
	public int deleteTodo(int todoNo) {
		return mapper.deleteTodo(todoNo);
	}


	@Override
	public String[] selectComInfoType(int memNo) {
		return mapper.selectComInfoType(memNo);
	}	
	
	
	// 내 예산

	@Override
	public List<Budget> selectBudget(int memNo) {
		return mapper.selectBudget(memNo);
	}


	@Override
	public void insertBudget(Budget budget) {
		mapper.insertBudget(budget);
	}


	@Override
	public void updateBudget(Budget budget) {
		mapper.updateBudget(budget);
	}


	@Override
	public void deleteBudget(int budgNo) {
		mapper.deleteBudget(budgNo);
	}
	

	@Override
	public int MycountTotalTODO(int memNo) {
		return mapper.MycountTotalTODO(memNo);
	}


	@Override
	public int MycountTODOdone(int memNo) {
		return mapper.MycountTODOdone(memNo);
	}


	@Override
	public int MycountTotalAuction(int memNo) {
		return mapper.MycountTotalAuction(memNo);
	}


	@Override
	public int MycountAuctiondone(int memNo) {
		return mapper.MycountAuctiondone(memNo);
	}


	@Override
	public int MycountCompanyLike(int memNo) {
		return mapper.MycountCompanyLike(memNo);
	}


	@Override
	public  int MytotalBudget(int memNo) {
		return mapper.MytotalBudget(memNo);
	}

	@Override
	public String getWedDate(int memNo) {
		return mapper.getWedDate(memNo);
	}


	@Override
	public int selectByTenderCnt(Auction auction) {
		return mapper.selectByTenderCnt(auction);
	}


	@Override
	public List<Todo> selectTodoThree(int memNo) {
		return mapper.selectTodoThree(memNo);
	}


	

	@Override
	public int MyspendBudget(int memNo) {
		return mapper.MyspendBudget(memNo);
	}



	@Override
	public int insertReservation(Reservation res) {
		return mapper.insertReservation(res);
	}


	@Override
	public Honeymoon selectHoneymoon(int auctionNo) {
		return mapper.selectHoneymoon(auctionNo);
	}


	@Override
	public Jewelry selectJewelry(int auctionNo) {
		return mapper.selectJewelry(auctionNo);
	}


	@Override
	public ServiceAdd selectServiceAdd(int auctionNo) {
		return mapper.selectServiceAdd(auctionNo);
	}


	@Override
	public Reservation selectReservation(Auction auction) {
		return mapper.selectReservation(auction);
	}


	@Override
	public int updateAuctionStatus(int auctionNo) {
		return mapper.updateAuctionStatus(auctionNo);
	}


	@Override
	public int updateTenderStatus(Tender tender) {
		return mapper.updateTenderStatus(tender);
	}








	
}
