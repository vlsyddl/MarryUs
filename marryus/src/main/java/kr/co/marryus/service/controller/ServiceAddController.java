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
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.ServiceAdd;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Venue;
import kr.co.marryus.wedservice.service.ServiceAddService;

@Controller("kr.co.marryus.service.controller.ServiceAddController")
@RequestMapping("/service/serviceAdd")
public class ServiceAddController {
	
	@Autowired
	private ServiceAddService service;
	
	@RequestMapping("/addcompanyList.do")
	public void companyList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, CompanyInfo companyInfo,
			CompanyFile companyFile,  Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.AddCompanyCount();
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
		System.out.println("List ============ " + service.AddCompanyList(page));
		model.addAttribute("addList", service.AddCompanyList(page));
	}
	
	
	@RequestMapping("/AddcompanyDetail.do")
	@ResponseBody
	public HashMap<String, Object> comDetail(int comInfoNo){
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("info", service.comInfoDetail(comInfoNo));
		List<CompanyFile> files = service.comInfoFiles(comInfoNo);
		listMap.put("files",files);
		return listMap;
	}
	
	
	
	
	@RequestMapping("/addauctionList.do")
	public void auctionList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.addauctionCount();
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
		System.out.println("List ============ " + service.addauctionList(page));
		model.addAttribute("AuctionList", service.addauctionList(page));
	}
	
	
	
	
	@RequestMapping("/serviceAddwriteForm.do")
	public void writeForm() {
		
	}
	// 역경매 신청
	@RequestMapping("/serviceAddwrite.do")
	public String write(@ModelAttribute ServiceAdd serviceAdd, @ModelAttribute Auction auction ) {
		System.out.println(serviceAdd);
		System.out.println(auction);
		service.addinsertAuction(auction);
		int auctionNo = auction.getAuctionNo();
		System.out.println(auctionNo);
		serviceAdd.setAuctionNo(auctionNo);
		System.out.println(serviceAdd);
		service.insertServiceAddAuction(serviceAdd);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "addauctionList.do";
	}
	
	
	
	
	@RequestMapping("/serviceAddAuctionDetail.do")
	@ResponseBody
	public HashMap<String, Object> addAuctionDetail(int auctionNo){
		HashMap<String, Object> listMap = new HashMap();
		System.out.println("auction ========= " + service.addauctionDetail(auctionNo));
		listMap.put("auction", service.addauctionDetail(auctionNo));
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
			System.out.println("service.selectCompanyDetail(memNo) === " + service.selectCominfo(memNo));
			return service.selectCominfo(memNo);
		}
		
		@RequestMapping("/Tenderwrite.do")
		public String Tenderwrite(Tender tender) {
			System.out.println(tender);
			service.insertTender(tender);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "addauctionList.do";
		}
	
		@RequestMapping("/weddingsearch.do")
		@ResponseBody
		public List<CompanyInfo> search( Search search){
			System.out.println("search=====" + search);
			List<CompanyInfo> scList = service.selectWeddingSearch(search);
			return scList;
		}
		
		
		@RequestMapping("/loginCheck.json")
		@ResponseBody
		public Member loginCheck(CompanyInfo companyInfo) {
			System.out.println("service.loginCheck(companyInfo)" + service.loginCheck(companyInfo));
			return service.loginCheck(companyInfo);
		}
		
	
	
	
	
}





















