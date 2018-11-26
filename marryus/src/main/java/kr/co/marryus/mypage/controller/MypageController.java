package kr.co.marryus.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.marryus.mypage.service.MypageService;
import java.io.File;
import java.util.UUID;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Page;



@Controller("kr.co.marryus.mypage.controller.MypageController")
@RequestMapping("/mypage")
public class MypageController {
	
	
	@Autowired
	MypageService service;
	

	@RequestMapping("/mywedding.do")
	public void mywedding() {
	}
	
	@RequestMapping("/myProfile.do")
	public void myProfile() {
		
	}
	
	
    @RequestMapping("/insertComInfo.do")
    public String insertComInfoProfile(CompanyInfo comInfo, MultipartFile[] file, HttpSession session) throws Exception{
        service.insertComInfo(comInfo);
        
        for(MultipartFile f:file) {
            CompanyFile comFile = new CompanyFile();
            String fileName = f.getOriginalFilename();
            String ext = fileName.substring(fileName.indexOf("."),fileName.length());
            fileName =UUID.randomUUID().toString()+ext;
            comFile.setComFileOriname(f.getOriginalFilename());
            comFile.setComFilePath("img/comProfile");
            comFile.setComInfoNo(comInfo.getComInfoNo());
            comFile.setComFileName(fileName);
            service.insertComFile(comFile);
            f.transferTo(new File("C:\\app\\tomcat_workspace\\marryus\\resources\\img\\comProfile", fileName));
        }
        
        
        return "mypage/myProfile";
    }
	
	
	@RequestMapping("/fileUpload.do")
	public void fileUPload() {
	}
	
	
	

	@RequestMapping("/auctionList.do")
    public void auctionList(/*HttpSession session*/ Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
        int pageSize=10;
        int lastPage = (int) Math.ceil(service.selectAuctionCnt(10) / 10d);
        int currTab = (pageNo - 1) / pageSize + 1;
        System.out.println(service.selectAuctionCnt(10)+":::::::::"+lastPage+":::::::"+currTab);

        Page page = new Page();
        page.setComNo(10);
        page.setPageNo(pageNo);
        
        
        model.addAttribute("autionList",service.selectAuction(page));
        model.addAttribute("beginPage", ((currTab - 1) * pageSize + 1));
        model.addAttribute("endPage", currTab * pageSize < lastPage ? currTab * pageSize : lastPage);
        model.addAttribute("lastPage", (int) Math.ceil(service.selectAuctionCnt(10) / 10d));
        model.addAttribute("pageNo", pageNo);
        
	}
	
}
