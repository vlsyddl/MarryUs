package kr.co.marryus.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.mapper.MypageMapper;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Tender;


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
        // TODO Auto-generated method stub
        return mapper.deleteComFile(comInfoNo);
    }


    @Override
    public GeneralMember selectGeneralMember(int memNo) {
        // TODO Auto-generated method stub
        return mapper.selectGeneralMember(memNo);
    }


    @Override
    public CompanyMember selectCompanyMember(int memNo) {
        return mapper.selectCompanyMember(memNo);
       
    }

}
