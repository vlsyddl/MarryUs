package kr.co.marryus.service.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.PageResult;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.wedservice.service.WeddingService;




@Controller("kr.co.marryus.service.controller.ServiceContoller")
@RequestMapping("/service")
public class ServiceController {
	
	@Autowired
	private WeddingService service;
	
	@RequestMapping("/weddingHall.do")
	public void weddingHall(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, CompanyInfo companyInfo,
			CompanyFile companyFile,  Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.selectWeddingCount();
		int lastPage = (int) Math.ceil(count / 12d);

		// 페이지 블럭 시작
		int pageSize = 12;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		model.addAttribute("weddinigList", service.WeddingList(page));
		model.addAttribute("AuctionList", service.auctionList(page));
//		System.out.println(service.WeddingList(page));
		model.addAttribute("count", service.selectWeddingCount());
		model.addAttribute("Auctioncount", service.selectAuctionCount());
	}
	
	@RequestMapping("/weddingDetail.do")
	@ResponseBody
	public void weddingDetail(Model model, CompanyInfo companyInfo) {
		System.out.println(companyInfo);
		model.addAttribute("files", service.selectComFiles(companyInfo));
	}
	
//	@RequestMapping("/weddingDetail.do")
//	public void weddingDetail(Model model, int comInfoNo) {
////		System.out.println(comInfoNo);
//		model.addAttribute("weddingDetail", service.weddingDetail(comInfoNo));
//	}
	

//	@RequestMapping("/weddingAuction.do")
//	public void weddingAuction(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Auction auction) {
//		Page page = new Page();
//		page.setPageNo(pageNo);
//		
//		int count = service.selectAuctionCount();
//		int lastPage = (int) Math.ceil(count / 10d);
//		
//		// 페이지 블럭 시작
//		int pageSize = 10;
//		int currTab = (pageNo - 1) / pageSize + 1;
//		// 11번 부터 2페이지가 되는것
//		int beginPage = (currTab - 1) * pageSize + 1;
//		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;
//		
//		model.addAttribute("beginPage", beginPage);
//		model.addAttribute("endPage", endPage);
//		model.addAttribute("lastPage", lastPage);
//		model.addAttribute("pageNo", pageNo);
//		// System.out.println(service.listNotice(page).size());
//		model.addAttribute("AuctionList", service.auctionList(page));
////		System.out.println(service.AuctionList());
//		model.addAttribute("Auctioncount", service.selectAuctionCount());
//	}
	
	@RequestMapping("/writeForm.do")
	public void writeForm() {
		
	}
	// 역경매 신청
	@RequestMapping("/write.do")
	public String write(@ModelAttribute Venue venue, @ModelAttribute Auction auction ) {
		System.out.println(venue);
		System.out.println(auction);
		service.insertAuction(auction);
		int auctionNo = auction.getAuctionNo();
		System.out.println(auctionNo);
		venue.setAuctionNo(auctionNo);
		System.out.println(venue);
		service.weddingWrite(venue);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "weddingHall.do";
	}
	
	
	@RequestMapping("/comDetail.do")
	@ResponseBody
	public HashMap<String, Object> comDetail(int comInfoNo){
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("info", service.comInfoDetail(comInfoNo));
		List<CompanyFile> files = service.comInfoFiles(comInfoNo);
		listMap.put("files",files);
		return listMap;
	}
	
	
	
	
	//웨딩홀 역경매 리스트 디테일
	@RequestMapping("/weddingAuctionDetail.do")
	@ResponseBody
	public HashMap<String, Object> weddingAuctionDetail(int auctionNo){
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("wedList", service.WeddingAuctionDetail(auctionNo));
		return listMap;
	}
	
	//입찰서 등록
	@RequestMapping("/TenderwriteForm.do")
	@ResponseBody
	public Auction TenderwriteForm(int auctionNo) {
		
		System.out.println("writeForm . auctionNO === " +auctionNo);
		System.out.println("service.selectAuctionDetail(auctionNo) ==================" + service.selectAuctionDetail(auctionNo));
		return service.selectAuctionDetail(auctionNo);
	}
	
	@RequestMapping("/comInfoWrite.do")
	@ResponseBody
	public CompanyInfo comInfoWrite(int memNo) {
		System.out.println("infoWrite.memNo === " + memNo);
		System.out.println("service.selectCompanyDetail(memNo) === " + service.selectCompanyDetail(memNo));
		return service.selectCompanyDetail(memNo);
	}
	
	@RequestMapping("/Tenderwrite.do")
	public String Tenderwrite(Tender tender) {
		System.out.println(tender);
		service.insertTender(tender);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "weddingHall.do";
	}
	
	
	
	
}
