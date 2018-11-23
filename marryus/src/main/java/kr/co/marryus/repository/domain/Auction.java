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
	private Date auctionEDate;
}
