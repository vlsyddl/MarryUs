package kr.co.marryus.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.mapper.MypageMapper;
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
	public List<CompanyInfo> selectGeneralAuction(Auction auction) {
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
	public Venue selectVenue(Auction auction) {
		return mapper.selectVenue(auction);
	}


	@Override
	public Studio selectStudio(Auction auction) {
		return mapper.selectStudio(auction);
	}


	@Override
	public Dress selectDress(Auction auction) {
		return mapper.selectDress(auction);
	}


	@Override
	public Makeup selectMakeup(Auction auction) {
		return mapper.selectMakeup(auction);
	}


	@Override
	public Jewelry selectHoneymoon(Auction auction) {
		return mapper.selectHoneymoon(auction);
	}


	@Override
	public ServiceAdd selectJewelry(Auction auction) {
		return mapper.selectJewelry(auction);
	}


	@Override
	public int updateVenue(Venue venue) {
		return mapper.updateVenue(venue);
	}


	@Override
	public int updateStudio(Studio studio) {
		return mapper.updateStudio(studio);
	}


	@Override
	public int updateDress(Dress dress) {
		return mapper.updateDress(dress);
	}


	@Override
	public int updateMakeup(Makeup makeup) {
		return mapper.updateMakeup(makeup);
	}


	@Override
	public int updateJewelry(Jewelry jewelry) {
		return mapper.updateJewelry(jewelry);
	}


	@Override
	public int updateServiceAdd(ServiceAdd serviceAdd) {
		return mapper.updateServiceAdd(serviceAdd);
	}


	@Override
	public List<Todo> selectTodo(int memNo) {
		return mapper.selectTodo(memNo);
	}


	@Override
	public int insertTodo(Todo todo) {
		return mapper.insertTodo(todo);
	}


	@Override
	public int updateTodo(Todo todo) {
		return mapper.updateTodo(todo);
	}







	
}
