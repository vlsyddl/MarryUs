package kr.co.marryus.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Auction {
	private int auctionNo;
	private int memNo;
	private String auctionType;
	private String auctionStatus;
	private Date auctionSdate;
	private Date auctionEdate;
	private String memName;
	// collection
	private Member member;
	private WeddingPlan weddingPlan;
	
	private Studio studio;
	private Makeup makeup;
	private Dress dress;
	private Jewelry jewelry;
	private Honeymoon honeyMoon;
	private ServiceAdd serviceAdd;
	private Venue venue;
	
	
	private Tender tender;
	private List<CompanyInfo> tenderList;
	private int tenderCnt;
	
	private int pageNo;
	
	private int dday;
	
	
}
