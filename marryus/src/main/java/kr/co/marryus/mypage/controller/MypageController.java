package kr.co.marryus.mypage.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.marryus.main.controller.MakeExcel;
import kr.co.marryus.member.service.MemberService;
import kr.co.marryus.mypage.service.MypageService;
import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Budget;
import kr.co.marryus.repository.domain.CompanyFile;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.CompanyLike;
import kr.co.marryus.repository.domain.CompanyMember;
import kr.co.marryus.repository.domain.GeneralMember;
import kr.co.marryus.repository.domain.Item;
import kr.co.marryus.repository.domain.Member;
import kr.co.marryus.repository.domain.Page;
import kr.co.marryus.repository.domain.Reservation;
import kr.co.marryus.repository.domain.Tender;
import kr.co.marryus.repository.domain.Todo;

@Controller("kr.co.marryus.mypage.controller.MypageController")
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	ServletContext context;

	@Autowired
	MypageService service;

	@Autowired
	MemberService memService;

	@Autowired
	PasswordEncoder passwordEncoder;

	@RequestMapping("/mywedding.do")
	public void mywedding(Model model, HttpSession session) throws Exception {
		int memNo = (((Member) session.getAttribute("user")).getNo());
		model.addAttribute("todo", service.selectTodoThree(memNo));
		String[] auctionList = { "v", "sdm", "h", "j", "e" };
		Map<String, Integer> list = new HashMap<>();
		for (String li : auctionList) {
			Auction auction = new Auction();
			auction.setMemNo(memNo);
			auction.setAuctionType(li);
			list.put(li, service.selectByTenderCnt(auction));
		}
		model.addAttribute("tenderCnt", list);
		model.addAttribute("totalBudget", service.MytotalBudget(memNo));
		model.addAttribute("spendBudget", service.MyspendBudget(memNo));
		model.addAttribute("likeCompany", service.MycountCompanyLike(memNo));
		model.addAttribute("todoTotal", service.MycountTotalTODO(memNo));
		model.addAttribute("todoDone", service.MycountTODOdone(memNo));
		model.addAttribute("auctionTotal", service.MycountTotalAuction(memNo));
		model.addAttribute("auctionDone", service.MycountAuctiondone(memNo));
		model.addAttribute("auctionDone", service.MycountAuctiondone(memNo));

		String weddingDate = service.getWedDate(memNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date date = sdf.parse(weddingDate);

		model.addAttribute("wedDate", date);

	}

	@RequestMapping("/myService.do")
	public void myService(HttpSession session, Model model) {
		model.addAttribute("comInfoType", service.selectComInfoType(((Member) session.getAttribute("user")).getNo()));
	}

	@RequestMapping("/fileUpload.do")
	public void fileUPload() {
	}

	/** 입찰 현황 보기 */
	@RequestMapping("/auctionList.do")
	public void auctionList(HttpSession session, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		int pageSize = 10;
		int lastPage = (int) Math.ceil(service.selectAuctionCnt(((Member) session.getAttribute("user")).getNo()) / 10d);
		int currTab = (pageNo - 1) / pageSize + 1;

		Page page = new Page();
		page.setMemNo(((Member) session.getAttribute("user")).getNo());
		page.setPageNo(pageNo);

		model.addAttribute("autionList", service.selectAuction(page));
		model.addAttribute("beginPage", ((currTab - 1) * pageSize + 1));
		model.addAttribute("endPage", currTab * pageSize < lastPage ? currTab * pageSize : lastPage);
		model.addAttribute("lastPage",
				(int) Math.ceil(service.selectAuctionCnt(((Member) session.getAttribute("user")).getNo()) / 10d));
		model.addAttribute("pageNo", pageNo);

	}

	/** 한 기업의 업체 리스트 */
	@RequestMapping("/service.do")
	public void service(HttpSession session, Model model) {
		model.addAttribute("autionList", service.selectComInfoList(((Member) session.getAttribute("user")).getNo()));
	}

	/** 업체 정보 올리기 */
	@ResponseBody
	@RequestMapping("/insertComInfo.do")
	public void insertComInfoProfile(CompanyInfo comInfo, MultipartFile[] files, MultipartFile file,
			HttpSession session) throws Exception {
		if (comInfo.getType().equals("insert")) {
			service.insertComInfo(comInfo);
		} else if (comInfo.getType().equals("update")) {
			service.updateComInfo(comInfo);
		}

		String imgPath = context.getRealPath("/img/comProfile");
		File filePath = new File(imgPath);
		if (filePath.exists() == false) {
			filePath.mkdirs();
		}
		for (MultipartFile f : files) {
			CompanyFile comFile = new CompanyFile();
			String fileName = f.getOriginalFilename();
			String ext = fileName.substring(fileName.indexOf("."), fileName.length());
			fileName = UUID.randomUUID().toString() + ext;
			comFile.setComFileOriname(f.getOriginalFilename());
			comFile.setComFilePath("img/comProfile");
			comFile.setComInfoNo(comInfo.getComInfoNo());
			comFile.setComFileName(fileName);
			comFile.setComFileRepr("N");
			service.insertComFile(comFile);
			f.transferTo(new File(imgPath, fileName));

		}

		if (!file.isEmpty()) {
			CompanyFile comFile = new CompanyFile();
			String fileName = file.getOriginalFilename();
			String ext = fileName.substring(fileName.indexOf("."), fileName.length());
			fileName = UUID.randomUUID().toString() + ext;
			comFile.setComFileOriname(file.getOriginalFilename());
			comFile.setComFilePath("img/comProfile");
			comFile.setComInfoNo(comInfo.getComInfoNo());
			comFile.setComFileName(fileName);
			comFile.setComFileRepr("Y");
			service.insertComFile(comFile);
			file.transferTo(new File(imgPath, fileName));
		}
	}

	/** 업체 서비스 정보 수정하기(작성글 보기) */
	@RequestMapping("/myServiceUpdate.do")
	public void myServiceUpdate(Model model, CompanyInfo comInfo) {
		model.addAttribute("auctionList", service.selectComInfoDetail(comInfo));
		model.addAttribute("file", service.selectComFile(comInfo));
		model.addAttribute("files", service.selectComFiles(comInfo));
	}

	/** 업체 서비스 정보 삭제하기 */
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

	/** 개인회원 정보 보기(정보수정) */
	@RequestMapping("/generalUpdateForm.do")
	public void generalUpdateForm(HttpSession session, Model model) {
		model.addAttribute("member", service.selectGeneralMember(((Member) session.getAttribute("user")).getNo()));
	}

	/** 업체회원 정보 보기(정보수정) */
	@RequestMapping("/companyUpdateForm.do")
	public void companyUpdateForm(HttpSession session, Model model) {
		model.addAttribute("member", service.selectCompanyMember(((Member) session.getAttribute("user")).getNo()));
	}

	/** 개인회원 정보 수정 */
	@ResponseBody
	@RequestMapping("/generalUpdate.do")
	public void generalUpdate(GeneralMember genMem, Member member, String prePass, MultipartFile file)
			throws Exception {
		if (member.getPass().isEmpty()) {
			member.setPass(passwordEncoder.encode(prePass));
		} else {
			member.setPass(passwordEncoder.encode(member.getPass()));
		}

		String imgPath = context.getRealPath("/img/genProfile");
		File filePath = new File(imgPath);
		if (filePath.exists() == false) {
			filePath.mkdirs();
		}

		if (!(file.isEmpty())) {
			String fileName = file.getOriginalFilename();
			String ext = fileName.substring(fileName.indexOf("."), fileName.length());
			fileName = UUID.randomUUID().toString() + ext;
			genMem.setGenProfilepath("img/genProfile");
			genMem.setGenProfilename(fileName);
			file.transferTo(new File(imgPath, fileName));
		}
		service.updateGeneralMember(genMem);
		service.updateMember(member);

	}

	/* 업체회원 정보 수정 */
	@ResponseBody
	@RequestMapping("/companyUpdate.do")
	public void companyUpdate(CompanyMember comMem, Member member, String prePass) {
		if (member.getPass().isEmpty()) {
			member.setPass(passwordEncoder.encode(prePass));
		} else {
			member.setPass(passwordEncoder.encode(member.getPass()));
		}

		service.updateMember(member);
		service.updateCompanyMember(comMem);
	}

	/* 정보 수정시 비밀번호 확인 */
	@ResponseBody
	@RequestMapping("/validMember.do")
	public String validMember(Member member, String prePass, Model model) {
		Member mem = memService.login(member);
		if (passwordEncoder.matches(prePass, mem.getPass())) {
			return "success";
		}
		return "fail";
	}

	/**/
	@RequestMapping("/myAuction.do")
	public void myAuction(String choo, Auction auction, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {

		try {

			Auction auction1 = auction;
			auction1.setPageNo(pageNo - 1);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("choose", choo);
			model.addAttribute("count", service.selectGeneralAuctionCnt(auction));
			if (service.selectGeneralAuctionCnt(auction) != 0) {
				model.addAttribute("myAuction", service.selectGeneralAuction(auction1));
			}

		} catch (Exception e) {
			e.getStackTrace();
		}

	}

	@RequestMapping("/likeCompany.do")
	public void likeCompany(HttpSession session, int memNo, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		int pageSize = 12;
		int lastPage = (int) Math
				.ceil(service.selectCompanyLikeCnt(((Member) session.getAttribute("user")).getNo()) / 12d);
		int currTab = (pageNo - 1) / pageSize + 1;

		Page page = new Page();
		page.setMemNo(((Member) session.getAttribute("user")).getNo());
		page.setPageNo(pageNo);

		model.addAttribute("like", service.selectCompanyLike(memNo));
		model.addAttribute("beginPage", ((currTab - 1) * pageSize + 1));
		model.addAttribute("endPage", currTab * pageSize < lastPage ? currTab * pageSize : lastPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", 1);

	}

	@RequestMapping("/likeCompanyDelete.do")
	public String likeCompanyDelete(CompanyLike comLike) {
		service.deleteCompanyLike(comLike);
		return "redirect:likeCompany.do?memNo=" + comLike.getMemNo();
	}

	@RequestMapping("/myTodo.do")
	public void myTodo(Model model, HttpSession session) {
		int memNo = (((Member) session.getAttribute("user")).getNo());
		model.addAttribute("todo", "lists:" + new Gson().toJson(service.selectTodoSortByCategory(memNo)));
		model.addAttribute("todoTotal", service.MycountTotalTODO(memNo));
		model.addAttribute("todoDone", service.MycountTODOdone(memNo));
	}

	@RequestMapping("/myTodolist.do")
	@ResponseBody
	public String myTodolist(HttpSession session) {
		// model.addAttribute("todo", new
		// Gson().toJson(service.selectTodoSortByCategory(((Member)session.getAttribute("user")).getNo())));
		return new Gson().toJson(service.selectTodoSortByCategory(((Member) session.getAttribute("user")).getNo()));
	}

	@RequestMapping("/myTodoWrite.do")
	@ResponseBody
	public String myTodoWrite(Item item, HttpSession session) throws Exception {
		Todo todo = item.getTodo();
		todo.setMemNo((((Member) session.getAttribute("user")).getNo()));
		service.insertTodo(todo);
		return todo.getTodoNo() + "";
	}

	@RequestMapping("/myTodoUpdate.do")
	@ResponseBody
	public void myTodoUpdate(Item item) throws Exception {
		service.updateTodo(item.getTodo());
	}

	@RequestMapping("/updateCheckTodo.do")
	@ResponseBody
	public void updateCheckTodo(Item item) throws Exception {
		;
		service.updateCheckTodo(item.getTodo());
	}

	@RequestMapping("/myTodoDelete.do")
	@ResponseBody
	public void myTodoDelete(Item item) throws Exception {
		int no = service.deleteTodo(item.getTodo().getTodoNo());
	}

	@RequestMapping("/downExcel.do")
	public void listExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap modelmap) throws Exception {

		List<Todo> todoList = service.selectTodoExcel(((Member) session.getAttribute("user")).getNo());

		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("todoList", todoList);

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		MakeExcel me = new MakeExcel();

		me.download(request, response, beans, "todoList", "todo.xlsx", "무시가능");
	}

	@RequestMapping("/reservation.do")
	@ResponseBody
	public int reservation(Reservation res, Tender tender) throws Exception {
		service.updateTenderStatus(tender);
		return service.insertReservation(res);

	}

	@RequestMapping("/purchase.do")
	@ResponseBody
	public int purchase(int auctionNo, Tender tender) throws Exception {
		service.updateTenderStatus(tender);
		return service.updateAuctionStatus(auctionNo);
	}

	@RequestMapping("/auctionView.do")
	@ResponseBody
	public Object auctionView(int auctionNo, String auctionType) throws Exception {
		if (auctionType.equals("v")) {
			return service.selectVenue(auctionNo);
		} else if (auctionType.equals("s")) {
			return service.selectStudio(auctionNo);
		} else if (auctionType.equals("d")) {
			return service.selectDress(auctionNo);
		} else if (auctionType.equals("m")) {
			return service.selectMakeup(auctionNo);
		} else if (auctionType.equals("j")) {
			return service.selectJewelry(auctionNo);
		} else if (auctionType.equals("h")) {
			return service.selectHoneymoon(auctionNo);
		} else if (auctionType.equals("e")) {
			return service.selectServiceAdd(auctionNo);
		}
		return "fail";
	}

	/**
	 * Mypage budget 정인용
	 * 
	 * @param model
	 * @param memNo
	 */
	@RequestMapping("/myBudget.do")
	public void myBudget(Model model, HttpSession session) throws Exception {
		int memNo = ((Member) session.getAttribute("user")).getNo();
		model.addAttribute("budgetList", service.selectBudget(memNo));
		model.addAttribute("totalBudget", service.MytotalBudget(memNo));
		model.addAttribute("spendBudget", service.MyspendBudget(memNo));

	}

	@RequestMapping("/writeMyBudget.do")
	@ResponseBody
	public void writeMyBudget(Budget budget) {
		service.insertBudget(budget);
	}

	@RequestMapping("/updateMyBudget.do")
	@ResponseBody
	public void updateMyBudget(Budget budget) {
		service.updateBudget(budget);
	}

	@RequestMapping("/deleteMyBudget.do")
	@ResponseBody
	public void deleteMyBudget(int budgNo) {
		service.deleteBudget(budgNo);
	}

	@RequestMapping("/downExcel2.do")
	public void listExcel2(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap modelmap) throws Exception {

		List<Budget> budget = service.selectBudget(((Member) session.getAttribute("user")).getNo());

		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("budget", budget);

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		MakeExcel me = new MakeExcel();

		me.download(request, response, beans, "budget", "budget.xlsx", "무시가능");
	}

	/**
	 * Mypage profile Detail 오수진 mypage profile - 카운트 다운
	 * 
	 * @param memNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/MyproFileWeddingDate.json", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> MygetWeddingDate(int memNo) throws Exception {
		HashMap<String, Object> wdMap = new HashMap<>();

		// String 값 Date로 parse
		String weddingDate = service.getWedDate(memNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date date = sdf.parse(weddingDate);

		wdMap.put("wedDate", date);
		return wdMap;
	}

}
