package kr.co.marryus.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/MyWeddingPlanSorting.do")
	public void MyWedding() {};
	@RequestMapping("/resultPlanning.do")
	public void resultPlanning() {};
	/**
	 * main 페이지 호출
	 */
	@RequestMapping("/main.do")
	public Model loginMain(Auction auction,Model model ) {
		System.out.println("auction status||"+auction.getAuctionStatus());
		System.out.println("auction type||"+auction.getAuctionType());
		
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
		
		return "redirect:MyWeddingPlanSorting.do";
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
	
	
}
