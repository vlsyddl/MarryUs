package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WeddingPlan {
	private int memNo;
	private String planPartner;
	private String planPlace;
	private String planWedDate;
	private String planVisitor;
	private String planBudget;
	
}
