package kr.co.marryus.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.marryus.main.service.MainServiceImpl;
import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.WeddingPlan;

/**
 * Main Controller
 * @author suzie
 *
 */
@Controller("kr.co.marryus.main.controller.MainContoller")
@RequestMapping("/main")
public class MainController {
	/**
	 * main service
	 */
	@Autowired
	MainServiceImpl service;
	
	/**
	 * main 페이지 호출
	 */
	@RequestMapping("/main.do")
	public void loginMain( ) {}
	
	/**
	 * 나만의 웨딩 플랜 데이터 입력 메소드 
	 * @param weddingPlan
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/submitWeddingPlan.do")
	public String submitWeddingPlan(WeddingPlan weddingPlan) throws Exception {
		service.insertWedPlan(weddingPlan);
		return "redirect:main.do";
	}
	
	@RequestMapping("/auctionList.json")
	@ResponseBody
	public List<Auction> auctionList(Auction auction) throws Exception{
		System.out.println("auction status||"+auction.getAuctionStatus());
		System.out.println("auction type||"+auction.getAuctionType());
		List<Auction> auctionList=service.selectActionlist(auction);
		
		return auctionList;
	}
	
	
}
