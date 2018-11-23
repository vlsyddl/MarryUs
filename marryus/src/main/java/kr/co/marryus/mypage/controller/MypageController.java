package kr.co.marryus.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.marryus.mypage.service.MypageService;
import kr.co.marryus.repository.mapper.MypageMapper;

@Controller("kr.co.marryus.mypage.controller.MypageController")
@RequestMapping("/mypage")
public class MypageController {
	
	
	@Autowired
	MypageService service;
	
	@Autowired
	MypageMapper mapper;
	
	@RequestMapping("/mywedding.do")
	public void mywedding() {
	}
	
	@RequestMapping("/myProfile.do")
	public void myProfile() {
	}
	
	
	@RequestMapping("/insertComInfoProfile.do")
	public String insertComInfoProfile() {
		return "/mywedding.do";
	}
	
	
	@RequestMapping("/fileUpload.do")
	public void fileUPload() {
	}
	
	@RequestMapping("/image.do")
	public String image( MultipartFile[] file, HttpSession session/*, int comInfoNo*/) {
		System.out.println(file.length);
		System.out.println("이미지 업로드입니다.");
		/*for(MultipartFile f:file) {
			System.out.println(f);
			System.out.println(f.getOriginalFilename());
		CompanyFile comFile = new CompanyFile();
		String fileName = f.getOriginalFilename();
		String ext = fileName.substring(fileName.indexOf("."),fileName.length());
		comFile.setComFileOriname(f.getOriginalFilename());
		comFile.setComFilePath("img/comProfile");
		fileName =UUID.randomUUID().toString()+ext;
		//comFile.setComInfoNo(comInfoNo);
		comFile.setComFileName(fileName);
		}*/
		
		return "/fileUpload.do";
	}
	
/*	@RequestMapping("/profile.k")
	public String fileUpload(MultipartFile file, HttpSession session) throws Exception{

		Member member = new Member();
		String Fname= file.getOriginalFilename();
		String ext= Fname.substring(Fname.indexOf("."), Fname.length());
		
		
		member.setProfilePath("/img/profile");
		Fname = UUID.randomUUID().toString()+ext;
		member.setProfileName(Fname);
		member.setUserNo(((Member)session.getAttribute("member")).getUserNo());
		file.transferTo(new File("C:\\app\\tomcat_workspace\\marryus\\img\\profile", Fname));
		return "success";
	}*/
	
	
	@RequestMapping("/auctionList.do")
	public void auctionList(/*HttpSession session*/ Model model) {
		/*service.selectTender(((Member)session.getAttribute("member")).getMemNo)*/
        model.addAttribute("autionList",service.selectAuction(10));
        System.out.println(mapper.selectCompanyMember(10).getComName());
        System.out.println(mapper.selectGeneralMember(15).getGenName());
	}
	
}
