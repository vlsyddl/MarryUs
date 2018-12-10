package kr.co.marryus.repository.domain;

import java.util.Date;


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
	private Tender tender;
	private Jewelry jewelry;
}
