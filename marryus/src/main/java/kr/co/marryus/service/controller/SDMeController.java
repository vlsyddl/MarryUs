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
import kr.co.marryus.repository.domain.Dress;
import kr.co.marryus.repository.domain.Makeup;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Studio;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.wedservice.service.SDMeService;

@Controller("kr.co.marryus.service.controller.SDMeController")
@RequestMapping("/service")
public class SDMeController {

	@Autowired
	private SDMeService service;
	
	@RequestMapping("/sdme/companyList.do")
	public void companyList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, CompanyInfo companyInfo,
			CompanyFile companyFile,  Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.sdmeCompanyCount();
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
		System.out.println("List ============ " + service.sdmeCompanyList(page));
		model.addAttribute("sdmeList", service.sdmeCompanyList(page));
	}
	
	@RequestMapping("/sdme/companyDetail.json")
	@ResponseBody
	public HashMap<String, Object> comDetail(int comInfoNo){
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("info", service.comInfoDetail(comInfoNo));
		List<CompanyFile> files = service.comInfoFiles(comInfoNo);
		listMap.put("files",files);
		return listMap;
	}
	
	@RequestMapping("/sdme/auctionList.do")
	public void auctionList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.sdmeAuctionCount();
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
		System.out.println("List ============ " + service.sdmeAuctionList(page));
		model.addAttribute("sdmeAuctionList", service.sdmeAuctionList(page));
	}
	
	@RequestMapping("/sdme/auctionDetail.json")
	@ResponseBody
	public Auction auctionDetail(Auction auction) {
		System.out.println("auction ====== " + service.sdmeAuctionDetail(auction));
		return service.sdmeAuctionDetail(auction);
	}
	
	@RequestMapping("/sdme/writeForm.do")
	public void writeForm() {
		System.out.println("writeForm.do 인데 안오는 것 같아요?!?!");
	}
	
	@RequestMapping("/sdme/writeStudio.do")
	public String writeStudio(@ModelAttribute Studio studio, @ModelAttribute Auction auction) {
		System.out.println("writeStudio.do인데 오나요?!");
		service.writeAuction(auction);
		int auctionNo = auction.getAuctionNo();
		
		studio.setAuctionNo(auctionNo);
		
		service.writeStudio(studio);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	@RequestMapping("/sdme/writeDress.do")
	public String writeDress(@ModelAttribute Dress dress, @ModelAttribute Auction auction) {
		System.out.println("writeDress.do인데 오나요??");
		service.writeAuction(auction);
		int auctionNo = auction.getAuctionNo();
		
		dress.setAuctionNo(auctionNo);
		
		service.writeDress(dress);

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	@RequestMapping("/sdme/writeMakeup.do")
	public String writeMakeup(@ModelAttribute Makeup makeup, @ModelAttribute Auction auction) {
		System.out.println("writeMakeup.do인데 오나요??");
		service.writeAuction(auction);
		int auctionNo = auction.getAuctionNo();
		
		makeup.setAuctionNo(auctionNo);
		
		service.writeMakeup(makeup);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	@RequestMapping("/sdme/auctionCheck.json")
	@ResponseBody
	public Auction auctionCheck(int auctionNo) {
		return service.auctionCheck(auctionNo);
	}
	
	@RequestMapping("/sdme/comInfoCheck.json")
	@ResponseBody
	public CompanyInfo comInfoCheck(CompanyInfo companyInfo) {
		System.out.println("companyInfo" + companyInfo);
		return service.comInfoCheck(companyInfo);
	}
	
	@RequestMapping("/sdme/writeTender.do")
	public String writeTender(Tender tender) {
		service.writeTender(tender);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	
} // end class
