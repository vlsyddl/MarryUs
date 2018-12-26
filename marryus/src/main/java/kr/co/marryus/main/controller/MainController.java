package kr.co.marryus.main.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.marryus.main.service.MainServiceImpl;
import kr.co.marryus.repository.domain.Auction;
import kr.co.marryus.repository.domain.Board;
import kr.co.marryus.repository.domain.CompanyInfo;
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;

/**
 * Main Controller
 * 
 * @author suzie
 *
 */
@Controller("kr.co.marryus.main.controller.MainContoller")
@RequestMapping("/main")
public class MainController {
	/**
	 * main service
	 */
	@Autowired
	MainServiceImpl service;

	@RequestMapping("/weddingPlanSort.do")
	public void WeddingPlan() {
	};

	@RequestMapping("/resultPlanning.do")
	public void resultPlanning() {
	};

	/**
	 * main 페이지 호출 및 옥션리스트 와 추천업체
	 */
	@RequestMapping("/main.do")
	public Model loginMain(Model model) {
		model.addAttribute("totalauctionList", service.totalAuctionList()); // 옥션리스트
		model.addAttribute("recommend", service.selectCompanyRecommned()); // 추천업체
		model.addAttribute("recVenue", service.recVenue()); // 추천업체 -웨딩홀
		model.addAttribute("recSDM", service.recSDM()); // 추천업체 -스드메
		model.addAttribute("recHoney", service.recHoney()); // 추천업체 -허니문
		model.addAttribute("recJewelry", service.recJewelry()); // 추천업체 -주얼리
		model.addAttribute("recEvent", service.recEvent()); // 추천업체 -추가 서비스
		return model;
	}

	/**
	 * 나만의 웨딩 플랜 데이터 입력 메소드
	 * 
	 * @param weddingPlan
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/submitWeddingPlan.do")
	public String submitWeddingPlan(WeddingPlan weddingPlan) throws Exception {
		service.insertWedPlan(weddingPlan);
		return "redirect:weddingPlanSort.do";
	}

	/**
	 * 나만의 웨딩 플랜 데이터 입력 메소드
	 * 
	 * @param weddingPlan
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updatetWeddingPlan.do")
	public String updateWeddingPlan(WeddingPlan weddingPlan) throws Exception {
		service.updateWedPlan(weddingPlan);
		return "redirect:weddingPlanSort.do";
	}

	/**
	 * Mywedding Plan 확인 여부
	 * 
	 * @param memNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkMyWeddingPlan.json", method = RequestMethod.POST)
	@ResponseBody
	public int checkWeddingPlan(Integer memNo) throws Exception {
		return service.myWedingPlan(memNo);
	}

	/**
	 * 나만의 웨딩 플랜 솔팅
	 * 
	 * @param todoCategory
	 * @throws Exception
	 */
	@RequestMapping(value = "/sortingPlan.json", method = RequestMethod.POST)
	@ResponseBody
	public void sortingPlan(Todo todo) throws Exception {

		/* service.sortingPlan(todo); */
		for (String t : todo.getTodoCategoryList()) {
			Todo to = new Todo();
			to.setMemNo(todo.getMemNo());
			to.setTodoCategory(t);
			service.sortingPlan(to);

		}

	}

	/**
	 * 나만의 웨딩플랜 결과 창
	 * 
	 * @param model
	 * @param todo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/resultPlanning.json")
	@ResponseBody
	public List<Todo> resultPlan(Model model, Todo todo) throws Exception {

		return service.selectTodoListByWP(todo);
	}

	/**
	 * 나만의 웨딩플랜 check 리스트 excele로 뽑기
	 * 
	 * @param request
	 * @param response
	 * @param todo
	 * @param modelmap
	 * @throws Exception
	 */
	@RequestMapping("/downExcel.do")
	public void listExcel(HttpServletRequest request, HttpServletResponse response, Todo todo, ModelMap modelmap)
			throws Exception {

		List<Todo> todoList = service.selectTodoListByWP(todo);

		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("todoList", todoList);

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		MakeExcel me = new MakeExcel();

		me.download(request, response, beans, "todoList", "todoList.xlsx", "무시가능");
	}

	/**
	 * 마감입박 역경매 건 리스트
	 * 
	 * @param auction
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deadlineList.json", method = RequestMethod.POST)
	@ResponseBody
	public List<Auction> listofDeadline(Auction auction) throws Exception {
		return service.selectAuctionEDate(auction);
	}

	/**
	 * main profil - planning Progress
	 * 
	 * @param memNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/proFileDetail.json", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Integer> TodoList(int memNo) throws Exception {
		HashMap<String, Integer> proFileMap = new HashMap<>();
		proFileMap.put("todoTotal", service.countTotalTODO(memNo));
		proFileMap.put("todoDone", service.countTODOdone(memNo));
		proFileMap.put("auctionTotal", service.countTotalAuction(memNo));
		proFileMap.put("auctionDone", service.countAuctiondone(memNo));
		proFileMap.put("likeCompany", service.countCompanyLike(memNo));
		proFileMap.put("totalBudget", service.totalBudget(memNo));
		proFileMap.put("spendBudget", service.spendBudget(memNo));

		return proFileMap;
	}

	/**
	 * main profile - 카운트 다운
	 * 
	 * @param memNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/proFileWeddingDate.json", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getWeddingDate(int memNo) throws Exception {
		HashMap<String, Object> wdMap = new HashMap<>();

		// String 값 Date로 parse
		String weddingDate = service.getWedDate(memNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		if (weddingDate != null) {
			Date date = sdf.parse(weddingDate);
			wdMap.put("wedDate", date);
		}
		return wdMap;
	}

	/**
	 * 리뷰 리스트
	 * 
	 * @param category
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reviewList.json", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, List<Board>> mainReviewList(String category) throws Exception {
		HashMap<String, List<Board>> rvList = new HashMap<>();
		rvList.put("rvList", service.mainReviewList(category));

		return rvList;
	}

}
