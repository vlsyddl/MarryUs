package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Venue {
	private int auctionNo;
	private String weddingVenue;
	private Date weddingDate;
	private Date weddingTime;
	private int weddingType;
	private int weddingVistor;
	private String weddingWish;
	private int weddingBudget;
	
}
