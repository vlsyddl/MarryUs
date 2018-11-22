package kr.co.marryus.mypage.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.marryus.repository.domain.CompanyFile;

@Controller("kr.co.marryus.mypage.controller.MypageController")
@RequestMapping("/mypage")
public class MypageController {

	@RequestMapping("/mywedding.do")
	public void mywedding() {
	}
	
	@RequestMapping("/myProfile.do")
	public void myProfile() {
	}
	
	@RequestMapping("/fileUpload.do")
	public void fileUPload() {
	}
	
	@RequestMapping("/image.do")
	public String image(List<MultipartFile> file, HttpSession session/*, int comInfoNo*/) {
		for(MultipartFile f:file) {
			System.out.println(f.getOriginalFilename());
		CompanyFile comFile = new CompanyFile();
		String fileName = f.getOriginalFilename();
		String ext = fileName.substring(fileName.indexOf("."),fileName.length());
		comFile.setComFileOriname(f.getOriginalFilename());
		comFile.setComFilePath("img/comProfile");
		fileName =UUID.randomUUID().toString()+ext;
		/*comFile.setComInfoNo(comInfoNo);*/
		comFile.setComFileName(fileName);
		}
		
		return "/mywedding.do";
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
	
}
