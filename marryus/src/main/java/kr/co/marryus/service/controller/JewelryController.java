package kr.co.marryus.service.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.Jewelry;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Search;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.wedservice.service.JewelryService;

@Controller("kr.co.marryus.service.controller.JewelryController")
@RequestMapping("/service/jewelry")
public class JewelryController {

	@Autowired
	private JewelryService service;
	
	@RequestMapping("/companyList.do")
	public void companyList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model,
			CompanyInfo companyInfo, CompanyFile companyFile, Auction auction) {
		Page page = new Page();
		page.setPageNo(pageNo);

		int count = service.jewelryCompanyCount();
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
		System.out.println("List ============ " + service.jewelryCompanyList(page));
		model.addAttribute("jewelryCompanyList", service.jewelryCompanyList(page));
	}
	
	@RequestMapping("/companyDetail.json")
	@ResponseBody
	public HashMap<String, Object> comDetail(int comInfoNo) {
		HashMap<String, Object> listMap = new HashMap();
		listMap.put("info", service.comInfoDetail(comInfoNo));
		List<CompanyFile> files = service.comInfoFiles(comInfoNo);
		listMap.put("files", files);
		
		return listMap;
	}
	
	@RequestMapping("/auctionList.do")
	public void auctionList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Auction auction ) {
		Page page = new Page();
		page.setPageNo(pageNo);
		
		int count = service.jewelryAuctionCount();
		int lastPage = (int) Math.ceil(count / 10d);
		
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;
		
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		System.out.println("auctionList ============ " + service.jewelryAuctionList(page));
		model.addAttribute("jewelryAuctionList", service.jewelryAuctionList(page));
	}
	
	@RequestMapping("/auctionDetail.json")
	@ResponseBody
	public Auction auctionDetail(Auction auction) {
		System.out.println(service.jewelryAuctionDetail(auction));
		return service.jewelryAuctionDetail(auction);
	}
	
//	@RequestMapping("/writeForm.do")
//	public void writeForm() {
//		System.out.println("writeForm 오는거야 마는거야 이 문구가 안뜬다면 여기를 지워라!!!");
//	}
	
	@RequestMapping("/writeJewelry.do")
	public String writeJewelry(@ModelAttribute Jewelry jewelry, @ModelAttribute Auction auction) {
		service.writeAuction(auction);
		
		int auctionNo = auction.getAuctionNo();
		
		jewelry.setAuctionNo(auctionNo);
		
		service.writeJewelry(jewelry);

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	@RequestMapping("/auctionCheck.json")
	@ResponseBody
	public Auction auctionCheck(int auctionNo) {
		return service.auctionCheck(auctionNo);
	}
	
	@RequestMapping("/comInfoCheck.json")
	@ResponseBody
	public CompanyInfo comInfoCheck(CompanyInfo companyInfo) {
		return service.comInfoCheck(companyInfo);
	}
	
	@RequestMapping("/writeTender.do")
	public String writeTender(Tender tender) {
		service.writeTender(tender);

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "auctionList.do";
	}
	
	@RequestMapping("/loginCheck.json")
	@ResponseBody
	public Member loginCheck(CompanyInfo companyInfo) {
		System.out.println("service.loginCheck(companyInfo)" + service.loginCheck(companyInfo));
		return service.loginCheck(companyInfo);
	}
	
	@RequestMapping("/comLikeCheck.json")
	@ResponseBody
	public int comLikeCheck(CompanyLike companyLike) {
		return service.comLikeCheck(companyLike);
	}
	
	@RequestMapping("/comLike.json")
	@ResponseBody
	public void comLike(CompanyLike companyLike) {
		service.comLike(companyLike);
	}
	
	@RequestMapping("/comLikeCancel.json")
	@ResponseBody
	public void comLikeCancel(CompanyLike companyLike) {
		service.comLikeCancel(companyLike);
	}
	
	
	//검색
	@RequestMapping("/jewelrysearch.do")
	@ResponseBody
	public List<CompanyInfo> search( Search search){
		System.out.println("search=====" + search);
		List<CompanyInfo> scList = service.selectJewelrySearch(search);
		return scList;
	}
	
}



























