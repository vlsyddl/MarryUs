package kr.co.marryus.main.controller;

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
import kr.co.marryus.repository.domain.Todo;
import kr.co.marryus.repository.domain.WeddingPlan;

/**
 * Main Controller
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
	
	@RequestMapping("/myWeddingPlanSorting.do")
	public void MyWedding() {};
	@RequestMapping("/resultPlanning.do")
	public void resultPlanning() {};
	/**
	 * main 페이지 호출
	 */
	@RequestMapping("/main.do")
	public Model loginMain(Auction auction,Model model ) {
		model.addAttribute("auction", service.selectActionlist(auction));
		return model;
		
	}
	
	/**
	 * 나만의 웨딩 플랜 데이터 입력 메소드 
	 * @param weddingPlan
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/submitWeddingPlan.do")
	public String submitWeddingPlan(WeddingPlan weddingPlan) throws Exception {
		service.insertWedPlan(weddingPlan);
		
		return "redirect:myWeddingPlanSorting.do";
	}
	
	
	/**
	 * 역경매 현황 리스트 !!
	 * @param auction
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/auctionList.json",  method= RequestMethod.POST)
	@ResponseBody
	public List<Auction> auctionList(Auction auction) throws Exception{
		
		return service.auctionList(auction);
		
	}
	/**
	 * 나만의 웨딩 플랜 솔팅
	 * @param todoCategory
	 * @throws Exception
	 */
	@RequestMapping(value ="/sortingPlan.json" ,method= RequestMethod.POST)
	@ResponseBody
	public void sortingPlan(Todo todo) throws Exception {
		System.out.println("실행");
		System.out.println("todo"+todo.getMemNo());
		
		/*service.sortingPlan(todo);*/
		for(String t: todo.getTodoCategoryList() ) {
			Todo to = new Todo();
			to.setMemNo(todo.getMemNo());
			to.setTodoCategory(t);
			service.sortingPlan(to);
			System.out.println("todo!"+to.getTodoCategory());
			System.out.println("todo!"+to.getMemNo());
			System.out.println("todo!"+to.getTodoDelete());
			System.out.println("완료");
		}
		
	}
	/**
	 * 나만의 웨딩플랜 결과 창 
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
	 * @param request
	 * @param response
	 * @param todo
	 * @param modelmap
	 * @throws Exception
	 */
	@RequestMapping("/downExcel.do")
	public void listExcel(HttpServletRequest request, HttpServletResponse response, Todo todo, ModelMap modelmap) throws Exception {
		System.out.println("tdodo?!?"+todo);
		
		List<Todo> todoList = service.selectTodoListByWP(todo);
		
		//받은 데이터를 맵에 담는다. 
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("todoList", todoList);
		
		//엑셀 다운로드 메소드가 담겨 있는 객체
		MakeExcel me = new MakeExcel();
		
		me.download(request, response, beans, "todoList", "todoList.xlsx", "무시가능");
	}
	
	/**
	 * 마감입박 역경매 건 리스트 
	 * @param auction
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deadlineList.json",method= RequestMethod.POST)
	@ResponseBody
	public List<Auction> listofDeadline(Auction auction) throws Exception{
		System.out.println(auction.getAuctionEDate());
		return service.selectAuctionEDate(auction);
	}
 	
}
