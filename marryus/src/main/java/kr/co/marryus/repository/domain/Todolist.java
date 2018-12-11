package kr.co.marryus.repository.domain;

import java.util.List;

import lombok.Data;

@Data
public class Todolist {
	private String title;
	private String common;
	private int memNo;
	private String id;
	private String defaultStyle;
	private List<Item> items;
	
	private String todoCheck;
	
	
}



