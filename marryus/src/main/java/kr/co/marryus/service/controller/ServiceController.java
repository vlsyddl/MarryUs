package kr.co.marryus.service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.wedservice.service.WeddingService;




@Controller("kr.co.marryus.service.controller.ServiceContoller")
@RequestMapping("/service")
public class ServiceController {
	
	@Autowired
	private WeddingService service;
	
	@RequestMapping("/weddingHall.do")
	public void weddingHall(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, CompanyInfo companyInfo,
			CompanyFile companyFile) {
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
//		System.out.println(service.WeddingList());
		model.addAttribute("count", service.selectWeddingCount());
	}
}
