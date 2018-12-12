package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Todo {
	private String todoPeriod;
	private String todoTitle;
	private int todoDday;
	private String todoCategory;
	private int todoNo;
	private int memNo;
	private Date todoDay;
	private String todoCheck;
	private String todoDelete;
	private String todoDetail;
	
	//콜렉션
	
	private WeddingPlan weddingPlan;
	
	private String[] todoCategoryList;
	


}



   