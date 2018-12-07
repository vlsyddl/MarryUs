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
	private String tenderInfo;
	private int comInfoNo;
	

	
}
