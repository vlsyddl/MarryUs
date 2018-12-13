package kr.co.marryus.mypage.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.marryus.member.service.MemberService;
import kr.co.marryus.mypage.service.MypageService;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Item;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.Todolist;

import org.springframework.security.crypto.password.PasswordEncoder;



@Controller("kr.co.marryus.mypage.controller.MycompanyController")
@RequestMapping("/mycompany")
public class MycompanyController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	MypageService service;
	
	@Autowired
	MemberService memService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	

	@RequestMapping("/myCompany.do")
	public void mycompany() {
	}
	
	@RequestMapping("/myService.do")
	public void myService(HttpSession session, Model model) {
		model.addAttribute("comInfoType", service.selectComInfoType(((Member)session.getAttribute("user")).getNo()));
	}
	

	
	
	
	/** 입찰 현황 보기 */
	@RequestMapping("/auctionList.do")
    public void auctionList(HttpSession session, Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
        int pageSize=10;
        int lastPage = (int) Math.ceil(service.selectAuctionCnt(((Member)session.getAttribute("user")).getNo()) / 10d);
        int currTab = (pageNo - 1) / pageSize + 1;

        Page page = new Page();
        page.setMemNo(((Member)session.getAttribute("user")).getNo());
        page.setPageNo(pageNo);
        
        
        model.addAttribute("autionList",service.selectAuction(page));
        model.addAttribute("beginPage", ((currTab - 1) * pageSize + 1));
        model.addAttribute("endPage", currTab * pageSize < lastPage ? currTab * pageSize : lastPage);
        model.addAttribute("lastPage", (int) Math.ceil(service.selectAuctionCnt(((Member)session.getAttribute("user")).getNo()) / 10d));
        model.addAttribute("pageNo", pageNo);
        
	}
	
	
	
	
	/**한 기업의 업체 리스트 */
	@RequestMapping("/service.do")
	public void service(HttpSession session, Model model) {
		model.addAttribute("autionList", service.selectComInfoList(((Member)session.getAttribute("user")).getNo()));
	}
	
	
	/** 업체 정보 올리기  */
	@ResponseBody
    @RequestMapping("/insertComInfo.do")
    public void insertComInfoProfile(CompanyInfo comInfo, MultipartFile[] files, MultipartFile file, HttpSession session) throws Exception{
        if(comInfo.getType().equals("insert")) {
    	service.insertComInfo(comInfo);
        }else if(comInfo.getType().equals("update")){
    	service.updateComInfo(comInfo);
        }
        
        

        
        String imgPath = context.getRealPath("/img/comProfile");
        File filePath = new File(imgPath);
        if(filePath.exists()==false) {
        	filePath.mkdirs();}
        for(MultipartFile f:files) {
            CompanyFile comFile = new CompanyFile();
            String fileName = f.getOriginalFilename();
            String ext = fileName.substring(fileName.indexOf("."),fileName.length());
            fileName =UUID.randomUUID().toString()+ext;
            comFile.setComFileOriname(f.getOriginalFilename());
            comFile.setComFilePath("img/comProfile");
            comFile.setComInfoNo(comInfo.getComInfoNo());
            comFile.setComFileName(fileName);
            comFile.setComFileRepr("N");
            service.insertComFile(comFile);
            f.transferTo(new File(imgPath, fileName));

    
        }
        
        if(!file.isEmpty()) {
           CompanyFile comFile = new CompanyFile();
           String fileName = file.getOriginalFilename();
           String ext = fileName.substring(fileName.indexOf("."),fileName.length());
           fileName =UUID.randomUUID().toString()+ext;
           comFile.setComFileOriname(file.getOriginalFilename());
           comFile.setComFilePath("img/comProfile");
           comFile.setComInfoNo(comInfo.getComInfoNo());
           comFile.setComFileName(fileName);
           comFile.setComFileRepr("Y");
           service.insertComFile(comFile);
           file.transferTo(new File(imgPath, fileName));
        }
    }
	
	

	
	
	/** 업체 서비스 정보 수정하기(작성글 보기)*/
	@RequestMapping("/myServiceUpdate.do")
	public void myServiceUpdate(Model model, CompanyInfo comInfo) {
		model.addAttribute("auctionList", service.selectComInfoDetail(comInfo));
		model.addAttribute("file", service.selectComFile(comInfo));
		model.addAttribute("files", service.selectComFiles(comInfo));
	}
	
	
	/** 업체 서비스 정보 삭제하기*/
	@RequestMapping("/myServiceDelete.do")
	public String myServiceDelete(Model model, int comInfoNo) {
	service.deleteComInfo(comInfoNo);
    return "redirect:service.do";
	}
	
	/** 업체 서비스 파일 삭제하기 */
	@RequestMapping("/deleteImg.do")
	public void deleteImg(Integer comInfoNo) {
		service.deleteComFile(comInfoNo);
	}
	
	
	
	
	/** 업체회원 정보 보기(정보수정)*/	
	@RequestMapping("/companyUpdateForm.do")
	public void companyUpdateForm(HttpSession session,  Model model) {
		model.addAttribute("member",service.selectCompanyMember(((Member)session.getAttribute("user")).getNo()));
	}
	
	
	/** 업체회원 정보 수정*/
	@ResponseBody
	@RequestMapping("/companyUpdate.do")
	public void companyUpdate( CompanyMember comMem, Member member, String prePass) {
			if(member.getPass().isEmpty()) {
				member.setPass(passwordEncoder.encode(prePass));
			}else {
				member.setPass(passwordEncoder.encode(member.getPass()));
			}
		
		service.updateMember(member);
		service.updateCompanyMember(comMem);
	}
	
	/**정보 수정시 비밀번호 확인*/
	@ResponseBody
	@RequestMapping("/validMember.do")
	public String validMember(Member member, String prePass, Model model) {
		Member mem=memService.login(member);
		if(passwordEncoder.matches(prePass, mem.getPass())) {
			return "success";
		}
			return "fail";
	}
	
	
}


	
	


