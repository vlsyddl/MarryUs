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
}



   