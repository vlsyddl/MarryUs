package kr.co.marryus.repository.domain;


import lombok.Data;

@Data
public class Venue {
	private int auctionNo;
	private String weddingVenue;
	private String weddingDate;
	private String weddingTime;
	private String weddingType;
	private int weddingVistor;
	private String weddingWish;
	private int weddingBudget;
	private String memName;
	
	// collection
	private Member member;
	
}
