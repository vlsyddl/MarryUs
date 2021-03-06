package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Tender {
	private int tenderNo;
	private int auctionNo;
	private String tenderStatus;
	private int tenderBudget;
	private Date tenderRegdate;
	private int memNo;
	private String memName;
	private String tenderInfo;
	private int comInfoNo;
	private String tenderTitle;
	
	private double dday;
	private int sumTenderBudget;
	private int avgTenderBudget;
	

	
}
