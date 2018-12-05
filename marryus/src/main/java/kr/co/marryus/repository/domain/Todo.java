package kr.co.marryus.repository.domain;

import lombok.Data;

@Data
public class Todo {
	private String todoSchedule;
	private String todoContent;
	private int todoDday;
	private String todoCategory;
	private int todoNo;
	private int memNo;
	private String todoCheck;
	private String todoDelete;
	
	//콜렉션
	
	private WeddingPlan weddingPlan;
	
	private String[] todoCategoryList;
	
	/*public String getTodoCategory() {
		if(todoCategory.equals("w")) {
			todoCategory="웨딩";
		}else if(todoCategory.equals("wp")) {
			todoCategory="스,드,메";
		}else if(todoCategory.equals("p")) {
			todoCategory="예물,예단";
		}else if(todoCategory.equals("h")) {
			todoCategory="신혼집";
		}else if(todoCategory.equals("e")) {
			todoCategory="기타";
		}
		return todoCategory;
	}*/
}



   