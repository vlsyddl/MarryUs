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
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Honeymoon;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.wedservice.service.HoneymoonService;

@Controller("kr.co.marryus.service.controller.HoneymoonController")
@RequestMapping("/service")
public class HoneymoonController {
	
	@Autowired
	private HoneymoonService service;
	
	@RequestMapping("/honeymoon.do")
	public void honeyMoon(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, CompanyInfo companyInfo,
			CompanyFile companyFile,  Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.selectHoneymoonCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		model.addAttribute("honeymoonList", service.HoneymoonList(page));
		model.addAttribute("AuctionList", service.auctionList(page));
//		System.out.println(service.WeddingList(page));
		model.addAttribute("count", service.selectHoneymoonCount());
		model.addAttribute("Auctioncount", service.selectAuctionCount());
	}
	
	
	
	@RequestMapping("/HoneywriteForm.do")
	public void writeForm() {
		
	}
	// 역경매 신청
	@RequestMapping("/Honeywrite.do")
	public String write(@ModelAttribute Honeymoon honeymoon, @ModelAttribute Auction auction ) {
		System.out.println(honeymoon);
		System.out.println(auction);
		service.HoneyinsertAuction(auction);
		int auctionNo = auction.getAuctionNo();
		System.out.println(auctionNo);
		honeymoon.setAuctionNo(auctionNo);
		System.out.println(honeymoon);
		service.honeymoonAuction(honeymoon);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "honeymoon.do";
	}
	
	
	@RequestMapping("/SearchHoneymoon.json")
	@ResponseBody
	public List<CompanyInfo> searchHoneymoon(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Search search){
		int count = service.selectHoneySearchCount(search);
		int lastPage = (int) Math.ceil(count / 10d);
		
		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;
		System.out.println(service.searchHoneymoon(search));
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("search", service.searchHoneymoon(search));
		return service.searchHoneymoon(search);
	}
	
	
	
	
	@RequestMapping("/comHoneyDetail.do")
	@ResponseBody
	public HashMap<String, Object> comDetail(int comInfoNo){
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("info", service.comInfoDetail(comInfoNo));
		List<CompanyFile> files = service.comInfoFiles(comInfoNo);
		listMap.put("files",files);
		return listMap;
	}
	
	@RequestMapping("/honeyAuctionDetail.do")
	@ResponseBody
	public HashMap<String, Object> honeyAuctionDetail(int auctionNo){
		HashMap<String, Object> listMap = new HashMap();
		System.out.println("auction ========= " + service.HoneyAuctionDetail(auctionNo));
		listMap.put("auction", service.HoneyAuctionDetail(auctionNo));
		return listMap;
	}
	
	
	
	
	
	
	
	
	
	
}
