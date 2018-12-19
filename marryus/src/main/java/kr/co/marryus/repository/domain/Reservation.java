package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reservation {
	private int resNo;
	private int tenderNo;
	private String resVisit;
	private String resDate;
	private int resTime;
	private String resEmail;
	private int resPhone;
	private String resMessage;
	
	
	private int auctionNo;
	private String tenderStatus;
	private int tenderBudget;
	private Date tenderRegdate;
	private int memNo;
	private String memName;
	private String tenderInfo;
	private int comInfoNo;
	private String tenderTitle;
}
